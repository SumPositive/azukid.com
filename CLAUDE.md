# azukid.com 編集ガイド

静的 HTML サイト（GitHub Pages、`.nojekyll`）。ビルド不要。`docs/style.css` 共通スタイル。

## 基本ルール
- HTML/CSS の変更は必要に応じて **jp / en 両方** に反映する
  - `docs/jp/...` と `docs/en/...` は対になっている
- ビルド・コミット・push は **ユーザー側で実施** するので Claude は実行しない
- コミットメッセージは日本語

## 公開アプリパネルのバージョンバッジ

ホーム（`docs/jp/index.html` / `docs/en/index.html`）の各 `app-card` にある `app-card-versions` 内のバッジ。

### 標準パターン
```html
<div class="app-card-versions">
  <span class="app-card-version app-card-version-live">X.Y.Z 公開中</span>
  <!-- 審査中バージョン -->
  <!-- <span class="app-card-version app-card-version-review">x.x.x 審査中</span> -->
</div>
```
- `app-card-version-live` — 青（accent）：「公開中 / Live」
- `app-card-version-review` — オレンジ（yellow）：「審査中 / In Review」
- 審査中がない時はコメントアウトしてプレースホルダ `x.x.x` で残す

### よくある依頼パターン

**「アプリX Y.Z 公開中にして、審査中は削除」**
→ live を Y.Z に更新、review 行をコメントアウト（jp/en 両方）

**「アプリX Y.Z 審査中を表示」**
→ コメントアウトしてある review 行を有効化、バージョン更新（jp/en 両方）

**「アプリX Y.Z 公開中、履歴にも追記」**
→ 上記に加えて取扱説明 `docs/jp/sumpo/<App>/<app>.html` の履歴テーブルに行追加
  （en 側も対応）。日付・内容はユーザーに確認

### 文言対応表
| jp | en |
|---|---|
| 公開中 | Live |
| 審査中 | In Review |
| 審査提出中 | Submitted |
| βテスト中 | Beta |

## 取扱説明ページの履歴テーブル

`docs/jp/sumpo/<App>/<app>.html` の `<h2>履歴</h2>` セクション内テーブル。

```html
<tr><td>X.Y.Z</td><td>YYYY/M/D</td><td>変更内容</td></tr>
```

en 側にも対応する英訳行を追加する。日付未定なら `TBD`。

## テーマ切替

- `data-theme="light" | "dark"` 属性 + `localStorage` で永続化
- 全ページに anti-flash inline script と `theme.js` 参照あり
- 新規ページ作成時は既存ページのヘッダー構造をコピーする

## 主要ディレクトリ

```
docs/
├── jp/                  — 日本語ページ
│   ├── index.html       — ホーム（公開アプリパネル含む）
│   └── sumpo/
│       ├── index.html   — 作者自己紹介
│       ├── contact.html — お問い合わせ
│       └── <App>/<app>.html  — 各アプリ取扱説明
├── en/                  — 英語ページ（jp と対構造）
├── style.css            — 全ページ共通スタイル
├── theme.js             — ダーク/ライト切替
└── images/              — アイコン・画像
```
