FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y build-essential default-libmysqlclient-dev
RUN mkdir /image_stock
WORKDIR /image_stock
ADD Gemfile /image_stock/Gemfile
ADD Gemfile.lock /image_stock/Gemfile.lock
RUN bundle install
ADD . /image_stock