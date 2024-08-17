FROM ruby:3.3.3

ENV APP_HOME=/usr/src/app \
  LANG=C.UTF-8

WORKDIR $APP_HOME

RUN apt-get update && \
    apt-get install -yq \
    ca-certificates \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY ./Gemfile ./Gemfile
COPY ./Gemfile.lock ./Gemfile.lock

RUN bundle install