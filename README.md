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

気の利いたゲーム売上予測のAPIがない場合、適当にランダムの売上を出力するjson-serverを使う。

環境変数の設定が必要なので、.env.sampleを.envにファイル名を変更したのち、json-serverを立ち上げる。

```
node fake_api.js
```

elmのアプリを起動します。

```
elm-app start
```

http://localhost:3000 で起動したアプリにアクセスできます。

環境変数がないとランタイムエラーになるかもしれません。