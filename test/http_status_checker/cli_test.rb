require 'test_helper'

class CliTest < Minitest::Test
  def test_it_prints_version_when_command_is_version
    output = capture_output { HttpStatusChecker::Cli.run('-v') }
    assert_equal "Http status checker #{HttpStatusChecker::VERSION}\n", output
  end
end
