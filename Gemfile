source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.8"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis"
gem "dry-matcher"
gem "dry-transaction"
gem "dry-validation"
gem 'rack-cors'
gem "dry-struct"
gem "oj"
gem 'rswag', "~> 2.9.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "faker", require: false
  gem "pry-rails"
  gem "factory_bot_rails"
end

group :development do
  gem "web-console"

  # gem "rack-mini-profiler"
  # gem "spring"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "json_spec"
  gem "rswag-specs"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "webmock"
end
