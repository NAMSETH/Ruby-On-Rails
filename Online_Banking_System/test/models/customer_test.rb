require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = Customer.new({customerNumber: 123456789,
       email: "john@gmail.com", forename: "john", surname: "smith",
       phone: "01445567890", dob: 10/11/1996, password: "12345678",
        password_confirmation: "12345678"})
    @empty_customer = Customer.new
  end

  test "user should be valid" do
    assert @customer.valid?
  end

  test "user with non-matching password should be invalid" do
    @customer.password = "87654321"
    assert_not @customer.valid?
  end

  test "user with all empty fields" do
    assert_not @empty_customer.valid?
  end

  test "user with no forename" do
    @customer.forename = ""
    assert_not @customer.valid?
  end

  test "user with no surname" do
    @customer.surname = ""
    assert_not @customer.valid?
  end

  test "user with no email" do
    @customer.email = ""
    assert_not @customer.valid?
  end

  test "user with no phone" do
    @customer.phone = ""
    assert_not @customer.valid?
  end

  test "invalid email format" do
    @customer.email = "john_smith.com"
    assert_not @customer.valid?
  end

  test "invalid phone format" do
    @customer.phone = "3393-3334-55"
    assert_not @customer.valid?
  end

  test "invalid phone forat with no numeric characters" do
    @customer.phone = "012020ss3kekw21@"
    assert_not @customer.valid?
  end

  test "password too short" do
    @customer.password = "12345"
    assert_not @customer.valid?
  end


  test "password too long" do
    @customer.password = "1234567890123"
    assert_not @customer.valid?
  end

  test "forename is less than mimimum length" do
    @customer.forename = "J"
    assert_not @customer.valid?
  end

  test "surname is less than minimum length" do
    @customer.surname = "H"
    assert_not @customer.valid?
  end

end
