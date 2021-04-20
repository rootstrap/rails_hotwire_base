source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.3'

# The administration framework for Ruby on Rails.
gem 'activeadmin', '~> 2.9'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# ActiveRecord backend for Delayed::Job
gem 'delayed_job_active_record', '~> 4.1', '>= 4.1.5'
# Flexible authentication solution for Rails with Warden
gem 'devise', '~> 4.7', '>= 4.7.3'
# Adds an object-oriented layer of presentation logic to your Rails apps.
gem 'draper', '~> 4.0', '>= 4.0.1'
# For feature flags
gem 'flipper-active_record', '~> 0.20.3'
gem 'flipper-active_support_cache_store', '~> 0.20.3'
gem 'flipper-ui', '~> 0.20.3'
# Use Hotwire to make the app feel like an SPA
gem 'hotwire-rails', '~> 0.1.3'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# Omniauth to login with google and other providers
gem 'omniauth', '1.9.1' # TODO: we can use '~> 2.0' once this gets merged: https://github.com/heartcombo/devise/pull/5327/files
gem 'omniauth-google-oauth2', '~> 0.8.1'
# Agnostic pagination in plain ruby: it works with any framework
gem 'pagy', '~> 3.10'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Object oriented authorization for Rails applications
gem 'pundit', '~> 2.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# An utility first CSS framework
gem 'tailwindcss-rails', '~> 0.3.0'
# A framework for building reusable, testable & encapsulated view components in Ruby on Rails
gem 'view_component', '~> 2.24', require: 'view_component/engine'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Easing the form object pattern in Rails applications.
gem 'yaaf', '~> 0.2.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Help to kill N+1 queries and unused eager loading.
  gem 'bullet', '~> 6.1', '>= 6.1.2'
  # factory_bot_rails provides integration between factory_bot and rails 5.0 or newer
  gem 'factory_bot_rails', '~> 6.1'
  # dotenv-rails handles environment variables in development and testing environments
  gem 'dotenv-rails', '~> 2.7.6'
  # Combine 'pry' with 'byebug'. Adds 'step', 'next', 'finish', 'continue'
  # and 'break' commands to control execution.
  gem 'pry-byebug', '~> 3.9'
  # Use Pry as your rails console
  gem 'pry-rails', '~> 0.3.9'
  # rspec-rails is a testing framework for Rails 5+.
  gem 'rspec-rails', '~> 4.0.1'
end

group :development do
  # Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.
  gem 'annotate', '~> 3.1', '>= 3.1.1'
  # Provides a better error page for Rails and other Rack apps.
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  # Provides the Binding#of_caller method.
  gem 'binding_of_caller', '~> 1.0'
  # Brakeman is a static analysis tool which checks Ruby on Rails applications
  # for security vulnerabilities.
  gem 'brakeman', '~> 4.10', '>= 4.10.1'
  # Display performance information such as SQL time and flame graphs for each request
  # in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  # gem 'rack-mini-profiler', '~> 2.0'
  # Will open an email preview in the browser instead of sending.
  gem 'letter_opener', '~> 1.7'
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
  gem 'simplecov', '~> 0.17.0', require: false
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # WebMock allows stubbing HTTP requests and setting expectations on HTTP requests.
  gem 'webmock', '~> 3.11'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
