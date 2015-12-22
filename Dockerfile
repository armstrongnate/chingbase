FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ADD Gemfile* /usr/src/app/
RUN bundle install
ADD . /usr/src/app/
