require 'test_helper'


class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = Customer.new({customerNumber: 1234123412341234, email: "john@gmail.com", forename: "john", surname: "smtih", phone: "7777-7777", password: "12345678", password_confirmation: "12345678"})
  end
  test "user should be valid" do
    assert @customer.valid?
  end
  test "user with non-matching password should be invalid" do
    @customer.password = "87654321"
    assert_not @customer.valid?
  end
end
