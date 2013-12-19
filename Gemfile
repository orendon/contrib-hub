source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '3.2.16'

gem 'jquery-rails'
gem 'haml-rails'

# authentication
gem 'github_api'
gem 'omniauth'
gem 'omniauth-github'

# friendly urls
gem 'friendly_id'

# searches
gem 'ransack'
gem 'will_paginate'

# geolocation
gem 'geocoder'

# analytics
gem 'newrelic_rpm'

# tagging
gem 'acts-as-taggable-on'

gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier'
end

group :development, :test do
  gem 'quiet_assets'
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
end


group :test do
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'coveralls', require: false # https://coveralls.io
  gem 'database_cleaner', '1.0.1'
  gem 'capybara'
  gem 'jasminerice'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
