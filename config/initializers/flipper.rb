# frozen_string_literal: true

require 'flipper/ui'
require 'flipper/adapters/active_record'
require 'flipper/adapters/active_support_cache_store'

Flipper.configure do |config|
  config.default do
    adapter = Flipper::Adapters::ActiveRecord.new
    cached_adapter = Flipper::Adapters::ActiveSupportCacheStore.new(
      adapter,
      Rails.cache,
      expires_in: 1.hour
    )
    Flipper.new(cached_adapter)
  end
end
