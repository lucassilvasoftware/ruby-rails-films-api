require 'sidekiq'
require 'sidekiq-status'

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add MyMiddleware::Server::ErrorLogger

      # accepts :expiration (optional)
      Sidekiq::Status.configure_server_middleware config, expiration: 30.minutes

      # accepts :expiration (optional)
      Sidekiq::Status.configure_client_middleware config, expiration: 30.minutes
  end
end