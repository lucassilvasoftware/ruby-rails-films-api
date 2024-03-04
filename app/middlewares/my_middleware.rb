module MyMiddleware
  module Server
    class ErrorLogger
      include Sidekiq::ServerMiddleware

      def call(job_instance, job_payload, queue)
        begin
          yield
        rescue => ex
          puts ex.message
        end
      end
    end
  end
end
