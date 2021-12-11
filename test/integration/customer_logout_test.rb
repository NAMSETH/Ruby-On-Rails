require 'test_helper'

class CustomerLogoutTest < ActionDispatch::IntegrationTest
  test "logout with valid credentials" do
    get customer_login_url
    assert_response :success
    assert_not is_logged_in?
    assert_template 'customer_session/new'
    post customer_login_url, params: { session: {email: "mary@gmail.com", password: '12345678'}}
    assert_redirected_to accounts_path
    follow_redirect!
    assert_template 'accounts/index'
    assert is_logged_in?
    delete customer_logout_path
    assert_redirected_to root_path
    assert_not is_logged_in?
  end
end
