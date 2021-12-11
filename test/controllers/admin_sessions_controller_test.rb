require 'test_helper'

class AdminSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_login_url
    assert_response :success
  end

end
