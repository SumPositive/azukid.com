---
name: app-store-review-summary
description: 公開中のiOSアプリについて、2026年以降のApp Storeレビューを手動取得し、アプリ別または全アプリ横断で要望・不具合・評価点を集約する
---

# App Storeレビュー集約

ユーザーが都度手動でレビューを確認するためのスキル

## 対象メニュー

1. 全アプリ
2. モチメモ（Packlin）
3. カルメモ（Calclin）
4. 割勘（Divigo）
5. 体調メモ（Vitalin）
6. クレメモ（Deferin）
7. 和暦年齢メモ（Nenrin）

対象が指定されていない場合は、このメニューを提示して選択を待つ
「全アプリ」「モチメモ」のような名称指定にも対応する

## 実行

選択に対応するキーを指定して取得スクリプトを実行する

```bash
ruby azukid.com/tools/codex-skills/app-store-review-summary/scripts/fetch_reviews.rb --app all
```

個別アプリのキーは `packlin`、`calclin`、`divigo`、`vitalin`、`deferin`、`nenrin`

スクリプトが出力したMarkdownを読み、次の順で簡潔にまとめる

- 全体傾向と評価分布
- 改修を検討したい不具合・要望
- 維持したい評価点
- アプリ別の要点
- 対応優先度の提案

レビューが0件のアプリは、その旨を明記する
取得対象は2026年1月1日以降に投稿日があるレビューだけとする
レビュー本文にない内容を推測で補わない
取得結果は公開レビューの確認にだけ使用し、レビューへの返信や外部変更は行わない

## 認証と保存先

既存アプリの `fastlane/.env` にあるApp Store Connect APIキーを読み取り専用で再利用する
認証情報は表示せず、取得結果にも含めない
取得結果はワークスペース直下の `review-reports/` に日時付きで保存する

公開アプリの追加・削除があった場合は、`scripts/fetch_reviews.rb` の `APPS` とこのメニューを同時に更新する
App Storeへの公開リンクがない「ai番頭さん」は現時点の対象に含めない
