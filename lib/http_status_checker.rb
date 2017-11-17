require 'http_status_checker/version'
require 'http_status_checker/configuration'
require 'http_status_checker/client'

module HttpStatusChecker
  extend Configuration

  def self.client
    HttpStatusChecker::Client.new
  end

  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  def self.respond_to_missing?(method_name)
    client.respond_to?(method_name) || super
  end
end
