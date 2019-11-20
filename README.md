# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions

* ...


#!/bin/bash
rails new RoR_TDP2
cd RoR_TDP2

echo "gem 'hirb'" >> Gemfile
echo "gem 'devise'" >> Gemfile
echo "gem 'autoprefixer-rails'" >> Gemfile
echo "gem 'jquery-rails'" >> Gemfile
echo "gem 'twitter-bootstrap-rails'" >> Gemfile
echo "gem 'devise-bootstrap-views'" >> Gemfile
echo "gem 'devise-i18n-views'" >> Gemfile
echo "gem 'dotenv-rails'" >> Gemfile
echo "gem 'mysql2'" >> Gemfile

bundler install
bin/spring stop

echo "default: &default" > config/database.yml
echo "  adapter: mysql2" >> config/database.yml
echo "  encoding: utf8" >> config/database.yml
echo "  pool: <%= ENV.fetch(\"RAILS_MAX_THREADS\") { 5 } %>" >> config/database.yml
echo "  username: tdp2" >> config/database.yml
echo "  password: Culosucio" >> config/database.yml
echo "  socket: /var/run/mysqld/mysqld.sock" >> config/database.yml
echo "" >> config/database.yml
echo "development:" >> config/database.yml
echo "  <<: *default" >> config/database.yml
echo "  database: RoR_TDP2_development" >> config/database.yml
echo "" >> config/database.yml
echo "test:" >> config/database.yml
echo "  <<: *default" >> config/database.yml
echo "  database: RoR_TDP2_test" >> config/database.yml
echo "" >> config/database.yml
echo "production:" >> config/database.yml
echo "  <<: *default" >> config/database.yml
echo "  database: RoR_TDP2_production" >> config/database.yml

#echo "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }" >> config/environments/development.rb

rake db:drop
rake db:create
rails g devise:install
rails g devise User
rails g devise:views
rails db:migrate
rails g scaffold Esp mac:string version:integer
rails g scaffold Target name:string
rails g scaffold Device name:string latitude:float longitude:float target:references esp:references
rails g scaffold Issue message:string device:references
rails g scaffold Program name:string description:string
rails g scaffold Version number:integer changelog:string program:references
rails g migration CreateJoinTableDeviceVersion device version
rails g migration CreateJoinTableTargetProgram target program
#rails db:migrate