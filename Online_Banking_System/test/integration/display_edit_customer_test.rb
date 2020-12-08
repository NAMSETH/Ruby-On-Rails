require 'test_helper'

class DisplayEditCustomerTest < ActionDispatch::IntegrationTest
  test "inable to access customer details if not logged in" do
    get accounts_path
    assert_redirected_to customer_login_url
    assert_not is_admin_logged_in?
  end
end
