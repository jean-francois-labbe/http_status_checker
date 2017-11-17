require 'test_helper'

# test http client
class ClientTest < Minitest::Test
  def test_it_returns_a_hash_of_results
    VCR.use_cassette('site_status') do
      HttpStatusChecker.sites = ['https://ok_site.com', 'https://ko_site.com']
      expected = [{ url: 'https://ok_site.com', status: 200 },
                  { url: 'https://ko_site.com', status: 503 }]
      assert_equal expected, HttpStatusChecker.check
    end
  end

  def test_it_can_add_data_into_the_returned_hash
    VCR.use_cassette('site_status') do
      HttpStatusChecker.sites = ['https://ok_site.com']
      expected = [{ url: 'https://ok_site.com', status: 200, count: 1 }]
      result = HttpStatusChecker.check { |site, response| response[:count] = 1 }
      assert_equal expected, result
    end
  end
end
