source 'https://rubygems.org'

gem 'rails', '4.2.10'

ruby '2.4.2'

gem 'jquery-rails'
gem 'haml-rails'

gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

gem 'thin'
gem 'dotenv-rails'

# authentication
gem 'github_api', '0.15.0' # LOCKED DOWN
gem 'omniauth'
gem 'omniauth-github'
gem 'hashie', '3.4.6' # LOCKED DOWN to avoid warning (expect to work separately)

# friendly urls
gem 'friendly_id'

# searches
gem 'ransack'
gem 'will_paginate'
gem 'will_paginate-bootstrap'

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
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails', '2.99.0' # LOCKED DOWN
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
