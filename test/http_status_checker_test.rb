require 'test_helper'

class HttpStatusCheckerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HttpStatusChecker::VERSION
  end

  def test_it_can_be_configured_through_block
    HttpStatusChecker.configure do |config|
      config.sites = ['http://google.com']
    end
    assert_equal ['http://google.com'], HttpStatusChecker.sites
  end
end
