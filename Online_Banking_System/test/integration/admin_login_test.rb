require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
  test "login with valid credenttials" do
    get admin_login_url
    assert_response :success
    assert_not is_admin_logged_in?
    assert_template 'admin_sessions/new'
    post admin_login_url, params: { session: {email: "admin@gmail.com",
       password: '12345678'}}
    assert_redirected_to admin_users_path
    follow_redirect!
    assert_template 'admin_users/index'
    assert is_admin_logged_in?
  end

  test "login with invalid credenttials" do
    get admin_login_url
    assert_response :success
    assert_not is_admin_logged_in?
    assert_template 'admin_sessions/new'
    post admin_login_url, params: { session: {email: "admin@gmail.com",
      password: 'password'}}
    assert_response :success
    assert_template 'admin_sessions/new'
    assert_not is_admin_logged_in?
  end
end
