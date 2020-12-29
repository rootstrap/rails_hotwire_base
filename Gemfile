source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.0'

# Use Hotwire to make the app feel like an SPA
gem 'hotwire-rails', '~> 0.1.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Help to kill N+1 queries and unused eager loading.
  gem 'bullet', '~> 6.1', '>= 6.1.2'
  # factory_bot_rails provides integration between factory_bot and rails 5.0 or newer
  gem 'factory_bot_rails', '~> 6.1'
  # Combine 'pry' with 'byebug'. Adds 'step', 'next', 'finish', 'continue'
  # and 'break' commands to control execution.
  gem 'pry-byebug', '~> 3.9'
  # Use Pry as your rails console
  gem 'pry-rails', '~> 0.3.9'
  # rspec-rails is a testing framework for Rails 5+.
  gem 'rspec-rails', '~> 4.0.1'
end

group :development do
  # Brakeman is a static analysis tool which checks Ruby on Rails applications
  # for security vulnerabilities.
  gem 'brakeman', '~> 4.10', '>= 4.10.1'
  # Display performance information such as SQL time and flame graphs for each request
  # in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  # gem 'rack-mini-profiler', '~> 2.0'
  # Listens to file modifications and notifies you about the changes
  gem 'listen', '~> 3.3'
  # A code metric tool for rails codes, written in Ruby.
  gem 'rails_best_practices', '~> 1.20'
  # Reek is a tool that examines Ruby classes, modules and methods
  # and reports any code smells it finds.
  gem 'reek', '~> 6.0', '>= 6.0.2'
  # Rubocop with Rootstrap's code style
  gem 'rubocop-rails', '~> 2.3', '>= 2.3.2', require: false
  gem 'rubocop-rootstrap', '~> 1.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
end

group :test do
  # Adds support for Capybara system testing
  gem 'capybara', '>= 3.26'
  # To easily generate fake data
  gem 'faker', '~> 2.15', '>= 2.15.1'
  # Adds support for selenium driver
  gem 'selenium-webdriver'
  # Provides RSpec- and Minitest-compatible one-liners to test common Rails functionality
  gem 'shoulda-matchers', '~> 4.4', '>= 4.4.1'
  # Code coverage for Ruby
  gem 'simplecov', '~> 0.20.0'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # WebMock allows stubbing HTTP requests and setting expectations on HTTP requests.
  gem 'webmock', '~> 3.11'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
