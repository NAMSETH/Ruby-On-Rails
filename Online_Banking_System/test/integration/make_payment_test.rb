require 'test_helper'

class MakePaymentTest < ActionDispatch::IntegrationTest

  def setup
      @customer = Customer.new({id: 1, customerNumber: 1234567867,
     email: "peter123@gmail.com", forename: "peter", surname: "smith",
     phone: "44123451234", dob: "10/11/1996", password: "12345678",
      password_confirmation: "12345678"})
      @account1 = @account = Account.new({id: 20, accountName: "Basic Account",
      accountNumber: "12345678", balance: 1234.56, currency: "GBP"})
      @customer.accounts << @account
      @account2 = Account.new({id:21, accountName: "Reward Account",
      accountNumber: "11122233", balance: 1234.67, currency: "GBP"})
      @customer.accounts << @account2
      @customer.save

  end

  test "make valid payment" do
    get customer_login_url
    assert_response :success
    post customer_login_url, params: { session: {email: "mary@gmail.com", password: '12345678'}}
    assert_redirected_to accounts_path
    follow_redirect!
    assert_template 'accounts/index'
    get new_transaction_path(account_id: 12345678)
    assert_template 'transactions/new'
    post transactions_path, params: {transaction: { sendingAccount_id: 20, recievingAccount_id: "11122233", transactionNumber: "3458790", amount: 21.23, currency: "GBP"}}
    assert_response :success
    assert_template 'transactions/create'
  end
end
