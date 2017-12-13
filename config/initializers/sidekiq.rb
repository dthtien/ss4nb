Sidekiq.configure_client do |config|
  config.redis = { size: 5 }
end
Sidekiq.configure_server do |config|
  #no redis settings
end