source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'rails', '~> 5.2.3'
gem 'sqlite3'
gem 'puma', '~> 3.11'
gem 'sassc-rails', '~> 2.1'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap', '~> 4.0.0'
gem 'jquery-rails'
gem 'mini_magick', '~> 4.8'
gem 'will_paginate', :git => 'https://github.com/mislav/will_paginate.git'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'devise'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'ffaker'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end
