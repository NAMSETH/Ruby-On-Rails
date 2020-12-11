require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest

  test "Unable to access acccounts/index when not logged in as a customer" do
    get customer_login_url
    assert_not is_logged_in?
    get accounts_path
    assert_response :redirect
    assert_redirected_to customer_login_url
  end

  test "Able to access accounts/index when logged in as a customer" do
    get customer_login_url
    assert_response :success
    assert_not is_logged_in?
    assert_template 'customer_session/new'
    post customer_login_url, params: { session: {email: "mary@gmail.com",
      password: '12345678'}}
    assert_redirected_to accounts_path
    follow_redirect!
    assert_template 'accounts/index'
  end

  test "Unable to access accounts/new when logged in as a customer" do
    get customer_login_url
    post customer_login_url, params: { session: {email: "mary@gmail.com",
       password: '12345678'}}
    assert is_logged_in?
    get new_account_path
    assert_redirected_to admin_login_url
  end

  test "Able to access accounts/new when logged in as an admin" do
    get admin_login_url
    post admin_login_url, params: { session: {email: "admin1@gmail.com",
      password: '12345678'}}
    assert is_admin_logged_in?
    get new_account_path
    assert_template 'accounts/new'
  end

  test "Able to access accounts/show when logged in as an admin" do
    get admin_login_url
    post admin_login_url, params: { session: {email: "admin@gmail.com",
      password: '12345678'}}
    assert is_admin_logged_in?
    post '/accounts/show', params: {id: 2}
    assert_template 'accounts/show'
  end

  test "Unable to access accounts/show when not logged in" do
    get admin_login_url
    assert_not is_admin_logged_in?
    post '/accounts/show', params: {id: 2}
    assert_redirected_to admin_login_url
  end


  test "Unable to access accounts/show when logged in as a customer" do
    get customer_login_url
    post customer_login_url, params: { session: {email: "mary@gmail.com",
       password: '12345678'}}
    assert is_logged_in?
    post '/accounts/show', params: {id: 2}
    assert_redirected_to admin_login_url
  end

end
