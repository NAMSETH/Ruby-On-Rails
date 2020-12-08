require 'test_helper'

class AccountsHelper < ActionView::TestCase

  def setup
    @account = Account.new({accountName: "Basic Account",
      accountNumber: "12345678", balance: 1234.56, currency: "GBP"})
  end

  test "valid formatted balance for GBP" do
    formattedString = formatBalance(@account)
    assert_equal(formattedString, "£1234.56")
  end

  test "valid formatted balance for EUR" do
    @account.currency = "EUR"
    formattedString = formatBalance(@account)
    assert_equal(formattedString, "€1234.56")
  end

  test "valid formatted balance for USD" do
    @account.currency = "USD"
    formattedString = formatBalance(@account)
    assert_equal(formattedString, "$1234.56")
  end

end
