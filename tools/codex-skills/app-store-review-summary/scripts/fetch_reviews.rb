#!/usr/bin/env ruby

# 公開アプリのレビューをApp Store Connectからまとめて取得する

require "base64"
require "date"
require "fileutils"
require "json"
require "net/http"
require "openssl"
require "optparse"
require "pathname"
require "time"
require "uri"

WORKSPACE_ROOT = File.expand_path("../../../../..", __dir__)
API_BASE = "https://api.appstoreconnect.apple.com"
REVIEW_START_DATE = Date.new(2026, 1, 1)

# 公開アプリ名とApp Store Connect検索用のBundle IDを一元管理する
APPS = {
  "packlin" => { name: "モチメモ（Packlin）", bundle_id: "com.azukid.AzPackList5", project: "Packlin" },
  "calclin" => { name: "カルメモ（Calclin）", bundle_id: "com.azukid.AzukiSoft.AzCalc", project: "Calclin" },
  "divigo" => { name: "割勘（Divigo）", bundle_id: "com.azukid.AzSplitIt", project: "DialSplit" },
  "vitalin" => { name: "体調メモ（Vitalin）", bundle_id: "com.azukid.AzBodyNote", project: "Condition" },
  "deferin" => { name: "クレメモ（Deferin）", bundle_id: "com.azukid.AzCreditS1", project: "CreditMemo" },
  "nenrin" => { name: "和暦年齢メモ（Nenrin）", bundle_id: "com.azukid.agememo", project: "AgeMemo" }
}.freeze

def parse_options
  options = { app: nil }
  OptionParser.new do |parser|
    parser.banner = "使い方: ruby fetch_reviews.rb --app all|アプリキー"
    parser.on("--app APP", "対象アプリ。allで全アプリ") { |value| options[:app] = value }
  end.parse!

  allowed = ["all"] + APPS.keys
  unless allowed.include?(options[:app])
    warn "対象を --app で指定してください: #{allowed.join(', ')}"
    exit 2
  end
  options
end

def dotenv_values(path)
  File.readlines(path, chomp: true).each_with_object({}) do |line, values|
    stripped = line.strip
    next if stripped.empty? || stripped.start_with?("#")

    key, value = stripped.split("=", 2)
    next if value.nil?

    values[key.strip] = value.strip.sub(/\A(["'])(.*)\1\z/, "\\2")
  end
end

def credentials
  keys = %w[ASC_KEY_ID ASC_ISSUER_ID ASC_KEY_PATH]
  if keys.all? { |key| !ENV[key].to_s.empty? }
    return ENV.slice(*keys).merge("base_dir" => Dir.pwd)
  end

  APPS.each_value do |app|
    env_path = File.join(WORKSPACE_ROOT, app[:project], "fastlane", ".env")
    next unless File.file?(env_path)

    values = dotenv_values(env_path)
    next unless keys.all? { |key| !values[key].to_s.empty? }

    return values.slice(*keys).merge("base_dir" => File.dirname(File.dirname(env_path)))
  end

  raise "App Store Connect認証情報が見つかりません。各アプリの fastlane/.env を確認してください"
end

def base64url(value)
  Base64.urlsafe_encode64(value, padding: false)
end

def jwt_token(values)
  header = { alg: "ES256", kid: values.fetch("ASC_KEY_ID"), typ: "JWT" }
  now = Time.now.to_i
  payload = {
    iss: values.fetch("ASC_ISSUER_ID"),
    iat: now,
    exp: now + 1_200,
    aud: "appstoreconnect-v1"
  }
  unsigned = "#{base64url(header.to_json)}.#{base64url(payload.to_json)}"

  key_path = values.fetch("ASC_KEY_PATH")
  key_path = File.expand_path(key_path, values.fetch("base_dir")) unless Pathname.new(key_path).absolute?
  private_key = OpenSSL::PKey.read(File.read(key_path))
  der_signature = private_key.sign(OpenSSL::Digest::SHA256.new, unsigned)
  sequence = OpenSSL::ASN1.decode(der_signature)
  raw_signature = sequence.value.map { |integer| integer.value.to_s(2).rjust(32, "\0") }.join

  "#{unsigned}.#{base64url(raw_signature)}"
end

def api_get(url, token)
  uri = URI(url)
  request = Net::HTTP::Get.new(uri)
  request["Authorization"] = "Bearer #{token}"
  request["Accept"] = "application/json"

  response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
    http.open_timeout = 15
    http.read_timeout = 30
    http.request(request)
  end

  unless response.is_a?(Net::HTTPSuccess)
    detail = begin
      JSON.parse(response.body).fetch("errors", []).filter_map { |error| error["detail"] }.join(" / ")
    rescue JSON::ParserError
      nil
    end
    raise "App Store Connect APIエラー #{response.code}: #{detail.nil? || detail.empty? ? response.message : detail}"
  end

  JSON.parse(response.body)
end

def app_resource_id(app, token)
  query = URI.encode_www_form("filter[bundleId]" => app.fetch(:bundle_id), "limit" => 1)
  response = api_get("#{API_BASE}/v1/apps?#{query}", token)
  resource = response.fetch("data").first
  raise "#{app.fetch(:name)} がApp Store Connectに見つかりません" if resource.nil?

  resource.fetch("id")
end

def reviews_for(app, token)
  resource_id = app_resource_id(app, token)
  query = URI.encode_www_form(
    "fields[customerReviews]" => "rating,title,body,reviewerNickname,createdDate,territory",
    "sort" => "-createdDate",
    "limit" => 200
  )
  next_url = "#{API_BASE}/v1/apps/#{resource_id}/customerReviews?#{query}"
  reviews = []

  until next_url.nil?
    response = api_get(next_url, token)
    page_reviews = response.fetch("data")
    review_dates = page_reviews.map { |review| Time.parse(review.dig("attributes", "createdDate")).to_date }
    reviews.concat(page_reviews.select do |review|
      REVIEW_START_DATE <= Time.parse(review.dig("attributes", "createdDate")).to_date
    end)

    # 日付の降順なので2026年より前に達したら以降の取得を終了する
    break if review_dates.any? { |date| date < REVIEW_START_DATE }

    next_url = response.fetch("links", {})["next"]
  end
  reviews
end

def stars(rating)
  "★" * rating.to_i + "☆" * (5 - rating.to_i)
end

def markdown_report(results, generated_at)
  all_reviews = results.values.flatten
  ratings = (1..5).to_h do |rating|
    [rating, all_reviews.count { |review| review.dig("attributes", "rating").to_i == rating }]
  end
  average = if all_reviews.empty?
              "該当なし"
            else
              format("%.2f", all_reviews.sum { |review| review.dig("attributes", "rating").to_i }.fdiv(all_reviews.length))
            end

  lines = [
    "# App Storeレビュー取得結果",
    "",
    "- 取得日時: #{generated_at.iso8601}",
    "- 対象期間: #{REVIEW_START_DATE.iso8601}以降",
    "- 対象: #{results.keys.map { |key| APPS.fetch(key).fetch(:name) }.join('、')}",
    "- レビュー数: #{all_reviews.length}件",
    "- 平均評価: #{average}",
    "- 評価分布: ★5 #{ratings[5]}件 / ★4 #{ratings[4]}件 / ★3 #{ratings[3]}件 / ★2 #{ratings[2]}件 / ★1 #{ratings[1]}件",
    ""
  ]

  results.each do |key, reviews|
    lines << "## #{APPS.fetch(key).fetch(:name)}"
    lines << ""
    if reviews.empty?
      lines << "レビューはありません"
      lines << ""
      next
    end

    reviews.each do |review|
      attributes = review.fetch("attributes")
      date = Time.parse(attributes.fetch("createdDate")).to_date.iso8601
      territory = attributes["territory"] || "不明"
      title = attributes["title"].to_s.strip
      body = attributes["body"].to_s.strip
      lines << "### #{date} #{stars(attributes.fetch('rating'))} [#{territory}] #{title}"
      lines << ""
      lines << body
      lines << ""
    end
  end
  lines.join("\n")
end

options = parse_options
selected_keys = options.fetch(:app) == "all" ? APPS.keys : [options.fetch(:app)]
values = credentials
token = jwt_token(values)
results = selected_keys.to_h do |key|
  app = APPS.fetch(key)
  warn "#{app.fetch(:name)} のレビューを取得中"
  [key, reviews_for(app, token)]
end

generated_at = Time.now
output_dir = File.join(WORKSPACE_ROOT, "review-reports")
FileUtils.mkdir_p(output_dir)
suffix = options.fetch(:app) == "all" ? "all" : options.fetch(:app)
basename = "#{generated_at.strftime('%Y%m%d-%H%M%S')}-#{suffix}"
json_path = File.join(output_dir, "#{basename}.json")
markdown_path = File.join(output_dir, "#{basename}.md")

# 後から再集計できるようにAPI応答と読みやすい一覧を両方保存する
File.write(json_path, JSON.pretty_generate(results))
File.write(markdown_path, markdown_report(results, generated_at))

puts markdown_path
