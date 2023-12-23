source "https://rubygems.org"

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Bundle and process JavaScript
gem "jsbundling-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

# Use devise for authentication
gem "devise"

gem "omniauth"
gem "omniauth-facebook"
gem "omniauth-rails_csrf_protection"

# Use high_voltage to serve static pages
gem "high_voltage"

# Use pundit for authorization
gem "pundit"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows]

  gem "dotenv-rails"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Formats erb documents
  gem "htmlbeautifier", require: false
end

group :test do
  # Use Capybara for feature/integration tests
  gem "capybara"
  gem "capybara-screenshot"
  gem "selenium-webdriver"

  # Use Faker for generating fake data
  gem "faker"

  # Used by factory_bot:lint rake task to clear the database
  gem "database_cleaner"

  # Use factory_bot for generating test data
  gem "factory_bot_rails"

  # Use pundit-matchers for easier assertions on policies
  gem "pundit-matchers"

  # Use shoulda-matchers for easier assertions on models
  gem "shoulda-matchers"

  # Use simplecov for test coverage reports
  gem "simplecov", require: false

  # Use RSpec for testing
  gem "rspec-rails", "~> 5.0.0"
end

group :development do
  eval_gemfile "gemfiles/rubocop.gemfile"
end
