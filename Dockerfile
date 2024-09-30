# ベースイメージを指定
FROM node:16

# 作業ディレクトリを設定
WORKDIR /app

# パッケージのインストール
COPY package*.json ./
RUN npm install

# アプリケーションのソースコードをコピー
COPY . .

# ビルドの実行
RUN npm run build

# 80 ポートを開放
EXPOSE 80

# ビルドの結果を配信するために nginx を起動
CMD ["npx", "serve", "-s", "dist"]
