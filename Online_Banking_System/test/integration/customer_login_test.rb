require 'test_helper'

class CustomerLoginTest < ActionDispatch::IntegrationTest
  test "login with valid credenttials" do
    get customer_login_url
    assert_response :success
    assert_not is_logged_in?
    assert_template 'customer_session/new'
    post customer_login_url, params: { session: {email: "mary@gmail.com", password: '12345678'}}
    assert_redirected_to accounts_path
    follow_redirect!
    assert_template 'accounts/index'
    assert is_logged_in?
  end

  test "login with invalid credenttials" do
    get customer_login_url
    assert_response :success
    assert_not is_logged_in?
    assert_template 'customer_session/new'
    post customer_login_url, params: { session: {email: "mary@gmail.com", password: 'password'}}
    assert_response :success
    assert_template 'customer_session/new'
    assert_not is_logged_in?
  end
end
