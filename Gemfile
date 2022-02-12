# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'haml-rails', '~> 2.0'
gem 'pg'
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.2.3'

# Authentication/Authorization
gem 'devise'
gem 'devise_invitable'
gem 'doorkeeper'
gem 'pundit'

# API
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'grape-swagger-rails'

# Service
gem 'dry-monads'
gem 'dry-struct'
gem 'dry-types'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'letter_opener'
  gem 'pry', '~> 0.12.2'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.8'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'shoulda-matchers'
end
