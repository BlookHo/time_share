require 'test_helper'

class PerformanceTestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get performance_tests_index_url
    assert_response :success
  end

end
