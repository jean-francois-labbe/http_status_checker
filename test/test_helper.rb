$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'http_status_checker'
require 'minitest/autorun'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'test/vcr_cassettes'
  config.hook_into :webmock
end
