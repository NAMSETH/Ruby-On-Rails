require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
    @customer = Customer.new({customerNumber: 1234567898,
       email: "john@gmail.com", forename: "john", surname: "smith",
       phone: "44123451234", dob: "10/11/1996", password: "12345678",
        password_confirmation: "12345678"})
    @account = Account.new({accountName: "Basic Account",
      accountNumber: "12345678", balance: 1234.56, currency: "GBP"})
      @customer.accounts << @account
  end

  test "account with valid details" do
    assert @account.valid?
  end

  test "invalid account without account name" do
    @account.accountName = ""
    assert_not @account.valid?
  end

  test "invalid account without account number" do
    @account.accountNumber = ""
    assert_not = @account.valid?
  end

  test "invlaid account without a currency" do
    @account.currency = ""
    assert_not @account.valid?
  end

  test "invalid account with a negitive balance" do
    @account.balance = -34.56
    assert_not @account.valid?
  end

  test "valid account with a zero balance" do
    @account.balance = 0.00
    assert @account.valid?
  end

  test "valid account with a balance of 0.01" do
    @account.balance = 0.01
    assert @account.valid?
  end

  test "valid account with a very large balance" do
    @account.balance = 9999999.99
    assert @account.valid?
  end

  test "valid account with a balance of 100 million" do
    @account.balance = 100000000
    assert @account.valid?
  end

  test "invalid account balance of 100000001" do
    @account.balance = 100000001
    assert_not @account.valid?
  end

  test "invalid account with same account number" do
    @accountDuplicate = Account.new({accountName: "ISA Account",
      accountNumber: "12345678", balance: 1234.56, currency: "EUR"})
      assert_not @accountDuplicate.valid?
  end

end
