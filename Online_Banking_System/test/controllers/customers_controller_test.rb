require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest

  test "Able to access customers/index when logged in as an admin" do
    get admin_login_url
    assert_response :success
    assert_not is_admin_logged_in?
    assert_template 'admin_sessions/new'
    post admin_login_url, params: { session: {email: "admin@gmail.com",
      password: '12345678'}}
    assert_redirected_to admin_users_path
    get customers_path
    assert_template 'customers/index'
  end

  test "Unable to access customers/index when not logged in as an admin" do
    get admin_login_url
    assert_not is_admin_logged_in?
    get customers_path
    assert_response :redirect
    assert_redirected_to admin_login_url
  end

  test "Unable to access customers/index when logged in as a customer" do
    get customer_login_url
    assert_response :success
    assert_not is_logged_in?
    assert_template 'customer_session/new'
    post customer_login_url, params: { session: {email: "mary@gmail.com",
      password: '12345678'}}
    get customers_path
    assert_redirected_to admin_login_url
  end

  test "Able to access customers/edit when logged in as a customer" do
    get customer_login_url
    assert_response :success
    assert_not is_logged_in?
    assert_template 'customer_session/new'
    post customer_login_url, params: { session: {email: "mary@gmail.com",
      password: '12345678'}}
    get '/customers/2/edit'
    assert_template 'customers/edit'
  end

  test "Unable to access customers/edit when not logged in as a customer or admin" do
    get customer_login_url
    assert_not is_logged_in?
    get '/customers/2/edit'
    assert_redirected_to customer_login_url
  end

  test "Able to access customers/edit when logged in as an admin" do
    get admin_login_url
    assert_not is_admin_logged_in?
    post admin_login_url, params: { session: {email: "admin@gmail.com",
      password: '12345678'}}
    get '/customers/2/edit'
    assert_template 'customers/edit'
  end

  test "Able to access customers/new when logged in as an admin" do
    get admin_login_url
    assert_not is_admin_logged_in?
    post admin_login_url, params: { session: {email: "admin@gmail.com",
      password: '12345678'}}
    get '/customers/new'
    assert_template 'customers/new'
  end

  test "Unable to access customers/new when not logged in" do
    get admin_login_url
    assert_not is_admin_logged_in?
    get '/customers/new'
    assert_redirected_to admin_login_url
  end

  test "Unable to acccess customers/new when logged in as a customer" do
    get customer_login_url
    post customer_login_url, params: { session: {email: "mary@gmail.com",
       password: '12345678'}}
    get '/customers/new'
    assert_redirected_to admin_login_url
  end

end
