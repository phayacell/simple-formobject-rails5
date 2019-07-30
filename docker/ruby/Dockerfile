FROM ruby:2.6.3
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential nodejs

ARG BUNDLE_JOBS=2
RUN gem update --system && gem install bundler

RUN mkdir /app
WORKDIR /app
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
