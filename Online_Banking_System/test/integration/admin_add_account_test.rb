require 'test_helper'

class AdminAddAccountTest < ActionDispatch::IntegrationTest
  def setup
    seed_data
  end
  test "admin can create an account" do
    post admin_login_url, params: { session: {email: "admin1@gmail.com",
       password: '12345678'}}
    assert is_admin_logged_in?
    get new_account_path
    assert_response :success
    assert_template "accounts/_form", "accounts/new"
    post "/accounts", params: {account: {accountName: "Basic Account",
    accountNumber: "12345678", balance: 1234.56, currency: "GBP"}, customerNumber: "41228637263"}
    assert_redirected_to admin_users_path
    follow_redirect!
    assert_template 'admin_users/index'
    assert Account.find_by(accountNumber:12345678)
    assert Customer.find_by(customerNumber: 41228637263).accounts.include?(Account.find_by(accountNumber:12345678))
  end
end
