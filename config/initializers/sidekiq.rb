require_relative '../../app/middlewares/my_middleware.rb'

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add MyMiddleware::Server::ErrorLogger

    # accepts :expiration (optional)
    Sidekiq::Status.configure_server_middleware config

    # accepts :expiration (optional)
    Sidekiq::Status.configure_client_middleware config
  end
end
