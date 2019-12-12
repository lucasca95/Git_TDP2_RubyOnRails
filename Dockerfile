FROM ruby:2.6.5-alpine

RUN apk update && apk upgrade && apk add ruby ruby-json ruby-io-console ruby-bundler ruby-irb ruby-bigdecimal tzdata postgresql-dev && apk add nodejs && apk add curl-dev ruby-dev build-base libffi-dev && apk add build-base libxslt-dev libxml2-dev ruby-rdoc mysql-dev sqlite-dev curl yarn

RUN mkdir /app
WORKDIR /app

COPY . .

RUN gem install ovirt-engine-sdk -v '4.3.0' --source 'https://rubygems.org/'
RUN gem install bundler; \
    bundle update --bundler; \
    bundle install; \
    bundle update rake; \
    bundle update nokogiri; \
    cat Gemfile.lock

EXPOSE 3000

ENTRYPOINT ["sh", "./config/docker/startup.sh"]
