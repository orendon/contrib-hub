source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '3.2.16'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem "haml-rails"

# authentication
gem "github_api"
gem 'omniauth'
gem 'omniauth-github'

# friendly urls
gem "friendly_id"

# searches
gem 'ransack'
gem 'will_paginate'

# geolocation
gem 'geocoder'

# analytics
gem 'newrelic_rpm'

# tagging
gem 'acts-as-taggable-on'

# preloading tags
gem 'gon'

gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
  gem 'sass-rails'
  gem 'coffee-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier'
end

group :development, :test do
  gem 'quiet_assets'
  gem 'sqlite3'
  gem "rspec-rails"
  gem 'shoulda-matchers'
  gem "factory_girl_rails"
  gem 'simplecov', :require => false
  gem "faker"
  gem "database_cleaner", '1.0.1'
  gem "capybara"
  gem "launchy"
  gem "jasminerice"
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
