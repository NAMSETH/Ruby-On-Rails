require 'test_helper'

class CustomerLoginTest < ActionDispatch::IntegrationTest
  test "login with valid credenttials" do
    customer = Customer.new({customerNumber: 123456789,
       email: "mary@gmail.com", forename: "mary", surname: "smith",
       phone: "44123451234", dob: "10/11/1996", password: "12345678",
        password_confirmation: "12345678"})
    customer.save
    get customer_login_url
    assert_response :success
    assert_not is_logged_in?
    assert_template 'customer_session/new'
    post customer_login_url, params: { session: {email: "mary@gmail.com", password: '12345678'}}
    assert_redirect_to 'customers'
    follow_redirect!
    assert_template 'customers'
    assert is_logged_in?
  end
end
