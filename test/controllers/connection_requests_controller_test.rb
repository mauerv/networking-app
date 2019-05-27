require 'test_helper'

class ConnectionRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get connection_requests_new_url
    assert_response :success
  end

  test "should get create" do
    get connection_requests_create_url
    assert_response :success
  end

end
