source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.13'

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
gem 'kaminari'

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
  gem "database_cleaner"
  gem "capybara"
  gem "launchy"
  gem "jasminerice"
end

group :production do
  gem 'pg'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
