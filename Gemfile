source "https://rubygems.org"

ruby "3.1.0"

# default
gem "bootsnap", require: false
gem "importmap-rails"
gem "jbuilder"
gem "puma", ">= 5.0"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "stimulus-rails"
gem "turbo-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ]
end

group :development do
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
