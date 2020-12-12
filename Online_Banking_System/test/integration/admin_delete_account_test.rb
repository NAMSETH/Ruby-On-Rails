require 'test_helper'

class AdminRemoveAccountTest < ActionDispatch::IntegrationTest
  test "admin can delete an account" do
    post admin_login_url, params: { session: {email: "admin1@gmail.com",
       password: '12345678'}}
    assert is_admin_logged_in?
    l = Account.all.length
    delete "/accounts/12345678"
    assert l >  Account.all.length
  end
end
