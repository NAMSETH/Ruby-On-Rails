require 'test_helper'

class AdminUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_users_new_url
    assert_response :success
  end

end
