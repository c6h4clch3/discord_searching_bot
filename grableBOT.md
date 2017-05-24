# グラブルワード検索BOT
## 概要
- Discordで`search {検索キーワード}`と入力すると検索URLを返す
- GameWithがデフォルト(検索URLの取得が簡単なため)
- heroku上で動作(24h利用できる様にするってことだと思って)

## 仕様
- `search ::{engine-token} {検索キーワード}`で検索
  - `engine-token`
    - GameWithなどの検索に使う攻略サイト。  
    サイト内検索があるもの、かつGETクエリで投げられるものに限る。  
    未指定の場合はGameWith  
    ( https://xn--bck3aza1a2if6kra4ee0hf.gamewith.jp/search/results?query= )
  - `検索キーワード`
    - 検索に用いるキーワード。そのまま。  
    念のためURLエンコーディングする。

- 例：`search ::GameWith マグナ編成`

## 今後の修正
- ~~検索結果をcurlで取得、iframeの中からTOP5項目を抽出して貼り付けたい~~
  - →スクリプト動かしてるのでBotではどうしようもない。アウト。
  - Googleの`site:`キーワードを利用したスクレイピングでなら可能？
