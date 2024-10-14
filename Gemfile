source 'https://rubygems.org'

# Rails
gem 'rails', '7.1.4'
gem 'pg', '~> 1.1'  # PostgreSQL
gem 'puma', '~> 6.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'importmap-rails'
gem 'jwt'
# Authentication
gem 'devise'

# Front-end styling
gem 'bootstrap', '~> 5.0.0'

gem 'mini_racer', platforms: :ruby
gem 'execjs'

# Testing
group :development, :test do
  gem 'rspec-rails', '~> 5.0'
  gem 'factory_bot_rails'
  gem 'faker', '~> 2.21'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

# Utilities
gem 'turbo-rails'
gem 'jbuilder'

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'annotate'
  gem 'capistrano'
  gem "capistrano-rails"
  gem 'capistrano3-puma', require: false
  gem 'capistrano-rvm', require: false
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
