require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest

  test "Able to access transactions/new when logged in as a customer" do
    get customer_login_url
    assert_response :success
    assert_not is_logged_in?
    assert_template 'customer_session/new'
    post customer_login_url, params: { session: {email: "mary@gmail.com",
      password: '12345678'}}
    assert is_logged_in?
    get new_transaction_path, params: {account_id: 12345678}
    assert_template 'transactions/new'
  end

  test "Unable to acccess transactions/new when not logged in as a customer" do
    get customer_login_url
    assert_not is_logged_in?
    get new_transaction_path, params: {account_id: 12345678}
    assert_redirected_to customer_login_url
  end

  test "Able to access transactions/index when logged in as a customer" do
    get customer_login_url
    assert_response :success
    assert_not is_logged_in?
    assert_template 'customer_session/new'
    post customer_login_url, params: { session: {email: "mary@gmail.com",
      password: '12345678'}}
    assert is_logged_in?
    get transactions_path params: {account_id: 12345678}
    assert_template 'transactions/index'
  end

  test "Unable to access transactions/index when not logged in as a customer" do
    get customer_login_url
    assert_not is_logged_in?
    get transactions_path, params: {account_id: 12345678}
    assert_redirected_to customer_login_url
  end
end
