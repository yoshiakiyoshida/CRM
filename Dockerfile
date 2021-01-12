FROM ruby:2.7

# yarnのインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn

# Nodeのインストール
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - && \
  apt-get install -y nodejs

# コンテナ内の作業ディレクトリ
WORKDIR /app

# ローカルの作業場所を、コンテナ内の作業場所にコピー
COPY ./src /app

# 出力メッセージ
CMD echo "Webコンテナが起動しました"