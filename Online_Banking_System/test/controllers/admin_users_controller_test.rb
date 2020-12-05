require 'test_helper'

class AdminUsersControllerTest < ActionDispatch::IntegrationTest
  test "when not logged in, it redirects to login page" do
    get admin_users_new_path
    assert_redirected_to admin_login_url
  end

end
