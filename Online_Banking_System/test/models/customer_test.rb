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

  test "customerNumber should be unique" do
    customer2 = @customer.dup
    @customer.save
    assert_not customer2.valid?
  end

  test "customerNumber should not be blank" do
    @customer.customerNumber = " "
    assert_not @customer.valid?
  end

  test "customerNumber length should not be less than 8" do
    @customer.customerNumber = "12"
    assert_not @customer.valid?
  end

  test "customerNumber lenght should not be more than 16" do
    @customer.customerNumber = "123456789123456789"
    assert_not @customer.valid?
  end

  test "password should not be blank" do
    @customer.password = @customer.password_confirmation = " "
    assert_not @customer.valid?
  end

  test "password length should not be less than 8" do
    @customer.password = @customer.password_confirmation = "1234567"
    assert_not @customer.valid?
  end

  test "email should not be blank" do
    @customer.email = " "
    assert_not @customer.valid?
  end

  test "email should have a valid format" do
    @customer.email = "johnsmith"
    assert_not @customer.valid?
  end

end
