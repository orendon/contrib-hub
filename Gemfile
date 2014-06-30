source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.2'
gem 'jquery-rails'
gem 'haml-rails'

gem 'sass-rails',   '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier',  '~> 2.5.0'

gem 'thin'
gem 'dotenv-deployment'
gem 'dotenv-rails'

# authentication
gem 'github_api'
gem 'omniauth'
gem 'omniauth-github'

# friendly urls
gem 'friendly_id', '~> 5.0.2'

# searches
gem 'ransack'
gem 'will_paginate'
gem 'will_paginate-bootstrap', '0.2.5'

# geolocation
gem 'geocoder'

# analytics
gem 'newrelic_rpm'

# tagging
gem 'acts-as-taggable-on'

group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'
  gem 'hipchat', require: false
end

group :development, :test do
  gem 'pry'
  gem 'quiet_assets'
  gem 'sqlite3'
  gem 'factory_girl_rails', '~> 4.3.0'
  gem 'faker'
  gem 'rspec-rails', '~> 2.14.0'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'fivemat', require: false
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'coveralls', require: false # https://coveralls.io
  gem 'database_cleaner'
  gem 'capybara'
  gem 'jasminerice', git: 'https://github.com/bradphelan/jasminerice', branch: 'master'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
