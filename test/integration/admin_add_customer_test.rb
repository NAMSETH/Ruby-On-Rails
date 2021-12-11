require 'test_helper'

class AdminAddCustomerTest < ActionDispatch::IntegrationTest
  test "admin can create a customer" do
    post admin_login_url, params: { session: {email: "admin1@gmail.com",
       password: '12345678'}}
    assert is_admin_logged_in?
    get new_customer_path
    assert_response :success
    assert_template "customers/_form", "customers/new"
    post "/customers", params: {customer: {customerNumber: 1234587867,
       email: "peter2@gmail.com", forename: "peter", surname: "smith",
       phone: "44123451234", dob: "10/11/1996", password: "12345678",
       password_confirmation: "12345678"}}
    assert_redirected_to admin_users_path
    follow_redirect!
    assert_template 'admin_users/index'
    assert Customer.find_by(customerNumber:1234587867)
  end
end
