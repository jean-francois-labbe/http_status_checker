require 'faraday'
require 'typhoeus'
require 'typhoeus/adapters/faraday'

module HttpStatusChecker
  # Performs actual http checks
  class Client
    def check
      statuses = []
      connection.in_parallel do
        HttpStatusChecker.sites.each do |site|
          status = { url: site, status: connection.head(site) }
          yield site, status if block_given?
          statuses << status
        end
      end
      statuses.each do |site|
        site[:status] = site[:status].status
      end
    end

    private

    def connection
      @connection ||= Faraday.new(ssl: { verify: false }) do |faraday|
        faraday.adapter :typhoeus
      end
    end
  end
end
