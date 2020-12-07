require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "transaction with valid details" do
    assert @transaction.valid?
  end
