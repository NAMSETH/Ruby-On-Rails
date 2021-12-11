require 'test_helper'

class AdminRemoveCustomerTest < ActionDispatch::IntegrationTest
  test "admin can delete an account" do
    post admin_login_url, params: { session: {email: "admin1@gmail.com",
       password: '12345678'}}
    assert is_admin_logged_in?
    l = Customer.all.length
    delete "/customers/2"
    assert l >  Customer.all.length
  end
end
