# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'

SimpleCov.start 'rails' do
  add_group 'Services', 'app/services'
  add_group 'Entities', 'app/models/events'
  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  add_group 'Jobs', 'app/jobs'
  add_group 'Helpers', 'app/helpers'
  add_filter 'spec'
  add_filter 'config'
  add_filter 'app/admin'
end

require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/core'
require 'spec_helper'
require 'rspec/rails'
require 'factory_bot_rails'
require 'webmock/rspec'
require 'shoulda/matchers'
require 'pundit/rspec'
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |file| require file }

ActiveRecord::Migration.maintain_test_schema!
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers
  config.include ActiveJob::TestHelper
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  # Form objects specs
  config.define_derived_metadata(file_path: Regexp.new('/spec/forms/')) do |metadata|
    metadata[:type] = :form
  end

  config.include Shoulda::Matchers::ActiveModel, type: :form
  config.include Shoulda::Matchers::ActiveRecord, type: :form
  config.include ViewComponent::TestHelpers, type: :component
  config.include FactoryBot::Syntax::Methods
  config.include Helpers::FlipperToggler

  config.before do
    ActionMailer::Base.deliveries.clear
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
