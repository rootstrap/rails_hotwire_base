# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'factory_bot_rails'
require 'webmock/rspec'
require 'shoulda/matchers'

FactoryBot.factories.clear
FactoryBot.reload

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |file| require file }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.order = 'random'
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.include FactoryBot::Syntax::Methods

  config.before :each do
    ActionMailer::Base.deliveries.clear
  end
end
