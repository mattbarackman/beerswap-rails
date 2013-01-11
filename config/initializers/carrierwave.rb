CarrierWave.configure do |config|
  config.grid_fs_database = 'beerswap_development'
  config.grid_fs_host = 'localhost:27017'
end

CarrierWave.configure do |config|
  config.grid_fs_connection = Mongoid.database
  config.storage = :grid_fs
  config.root = Rails.root.join('tmp')
  config.cache_dir = "uploads"
end