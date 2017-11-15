require 'faraday'
require 'typhoeus'
require 'typhoeus/adapters/faraday'

module HttpStatusChecker
  # Performs actual http checks
  class Client
    def check
      conn = Faraday.new(ssl: { verify: false }) do |faraday|
        faraday.adapter :typhoeus
      end
      statuses = {}
      conn.in_parallel do
        HttpStatusChecker.sites.each do |site|
          response = { site.to_s => conn.head(site) }
          statuses.merge! response
        end
      end
      statuses.map do |key, value|
        [key, value.status]
      end.to_h
    end
  end
end
