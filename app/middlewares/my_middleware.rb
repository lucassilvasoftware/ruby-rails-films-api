class MyMiddleware::Server::ErrorLogger
    include Sidekiq::ServerMiddleware
  
    # @param [Object] job_instance the instance of the job that was queued
    # @param [Hash] job_payload the full job payload
    #   * @see https://github.com/sidekiq/sidekiq/wiki/Job-Format
    # @param [String] queue the name of the queue the job was pulled from
    # @yield the next middleware in the chain or worker `perform` method
    # @return [Void]
    def call(job_instance, job_payload, queue)
      begin
        yield
      rescue => ex
        puts ex.message
      end
    end
  end