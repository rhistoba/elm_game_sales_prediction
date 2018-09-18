# これは何？

Elmで作った、ゲームの売上予測を行うAPIのフロントWebアプリです。

# セットアップ

前提としてローカル環境に以下がインストールされている状態とします。

- elm (>= 0.18)
- create-elm-app

ローカルにソースを持ってくる。

```
git clone https://github.com/rhistoba/elm_game_sales_prediction.git
```

elmのライブラリをプロジェクト内に持ってくる。

```
elm-package install
```

jsのライブラリをプロジェクト内に持ってくる。

```
yarn install
```

# Webアプリを動かす

気の利いたゲーム売上予測のAPIがない場合、適当にランダムの売上を出力するjson-serverを使う。

環境変数の設定が必要なので、.envファイルをプロジェクトのルートに作成して、ファイルに以下の1行を追加。

```
ELM_APP_GSP_REQUEST_URL="http://localhost:4000/predict"
```

json-serverを立ち上げる。

```
node fake_api.js
```

elmのアプリを起動します。

```
elm-app start
```

http://localhost:3000で起動したアプリにアクセスできます。

上記の環境変数がないとランタイムエラーになるかもしれません。