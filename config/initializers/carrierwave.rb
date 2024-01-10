CarrierWave.configure do |config|
  config.asset_host = ENV.fetch('ASSET_HOST', 'http://localhost:3001')
  config.storage = :file
  config.cache_storage = :file
end