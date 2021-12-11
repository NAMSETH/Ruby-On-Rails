require 'test_helper'

class AdminUsersControllerTest < ActionDispatch::IntegrationTest

  test "Able to access admin_users/new when logged in as an admin" do
    get admin_login_url
    assert_response :success
    assert_not is_admin_logged_in?
    assert_template 'admin_sessions/new'
    post admin_login_url, params: { session: {email: "admin1@gmail.com",
      password: '12345678'}}
    assert is_admin_logged_in?
    get new_admin_user_path
    assert_template 'admin_users/new'
  end

  test "Unable to access admin_users/new when logged in as a customer" do
    get customer_login_url
    assert_response :success
    assert_not is_logged_in?
    assert_template 'customer_session/new'
    post customer_login_url, params: { session: {email: "mary@gmail.com",
      password: '12345678'}}
    assert is_logged_in?
    get new_admin_user_path
    assert_redirected_to admin_login_url
  end

  test "Unable to access admin_users/new when not logged in" do
    get admin_login_url
    assert_not is_admin_logged_in?
    get new_admin_user_path
    assert_redirected_to admin_login_url
  end

  test "Able to acccess admin_users/new when logged in as an admin" do
    get admin_login_url
    assert_response :success
    assert_not is_admin_logged_in?
    assert_template 'admin_sessions/new'
    post admin_login_url, params: { session: {email: "admin1@gmail.com",
      password: '12345678'}}
    assert is_admin_logged_in?
    get admin_users_path
    assert_template 'admin_users/index'
  end

  test "Unable to access admin_users/index when not logged in" do
    get admin_login_url
    assert_response :success
    assert_not is_admin_logged_in?
    get admin_users_path
    assert_redirected_to admin_login_url
  end

end
