source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'jquery-rails'
gem 'jquery-ui-rails'

# authentication
gem "github_api"
gem 'omniauth'
gem 'omniauth-github'

# searches
gem 'meta_search'

# geolocation
gem 'geocoder'

gem 'newrelic_rpm'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'sqlite3'

  gem "rspec-rails", "~> 2.11.0"
  gem "factory_girl_rails", "~> 4.1.0"
  gem 'simplecov', :require => false
  gem "faker", "~> 1.1.2"
end

group :production do
  gem 'pg'
end

gem 'acts-as-taggable-on'

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
