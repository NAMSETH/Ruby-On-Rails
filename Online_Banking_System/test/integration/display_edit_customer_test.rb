require 'test_helper'

class DisplayEditCustomerTest < ActionDispatch::IntegrationTest#
  test "Access customer details if admin is logged in" do
    get admin_users_url
    assert_not is_admin_logged_in?
    post admin_login_url, params: { session: {email: "admin@gmail.com", password: '12345678'}}
    follow_redirect!
    assert_template 'admin_users/index'
    assert is_admin_logged_in?
    get customers_url
    assert_template 'customers/index'
    get '/customers/2/edit'
    assert_template 'customers/edit'
  end

  test "Unable to access customer details if admin is not logged in" do
    get admin_users_url
    assert_not is_admin_logged_in?
    get customers_url
    assert_redirected_to admin_login_url
  end

end
