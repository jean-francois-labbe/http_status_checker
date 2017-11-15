require 'test_helper'

# test http client
class ClientTest < Minitest::Test
  def test_it_returns_a_hash_of_results
    VCR.use_cassette('site_status') do
      HttpStatusChecker.sites = ['https://ok_site.com', 'https://ko_site.com']
      expected = { 'https://ok_site.com' => 200, 'https://ko_site.com' => 503 }
      assert_equal expected, HttpStatusChecker.check
    end
  end
end
