source 'https://rubygems.org'
ruby '2.1.0'

gem 'rails', '4.0.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Temporarily allow attr_accessible
gem 'protected_attributes'

gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails',   '~> 4.0.1'
gem 'coffee-rails', '~> 4.0.1'

# Use Bootstrap for Admin Styles
gem 'bootstrap-sass', '~> 3.0.3.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby
gem 'bourbon'
# gem 'bourbon', :git => 'git://github.com/bmorrall/bourbon.git', :branch => 'keyframes-mixin'
gem 'uglifier', '>= 1.0.3'

gem 'jquery-rails'
gem 'jquery-rails-cdn'

# Use High Voltage for static pages
gem 'high_voltage', '~> 2.1.0'

gem 'simple_form'

# Use Flutie for page styles
gem 'flutie'

gem 'devise'

gem 'omniauth'
gem 'omniauth-facebook'

gem "cancan"

# Use NewRelic RPM for performance monitoring
gem 'newrelic_rpm'

# Use Settings Gem gem for properties
gem "rails-settings-cached"

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

group :test do
  gem 'coveralls', require: false
  gem "factory_girl_rails"
  gem "faker"
  gem "shoulda-matchers"
end

group :test, :development do
  gem "rspec-rails", "~> 2.0"
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'selenium-webdriver'

  gem 'cucumber-rails', :require => false
  gem 'pickle'
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end

