require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1',
      path_style: true
    }
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'zukan-create'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/zukan-create'
  else
    config.asset_host = ENV.fetch('ASSET_HOST', 'http://localhost:3001')
    config.storage = :file
    config.cache_storage = :file
  end
end