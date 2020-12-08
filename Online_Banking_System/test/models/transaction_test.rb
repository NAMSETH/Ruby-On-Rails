require 'test_helper'

class TransactionTest < ActiveSupport::TestCase 
    def setup
        @customer = Customer.new({id: 1, customerNumber: 1234567867,
       email: "peter123@gmail.com", forename: "peter", surname: "smith",
       phone: "44123451234", dob: "10/11/1996", password: "12345678",
        password_confirmation: "12345678"})
        @account1 = @account = Account.new({accountName: "Basic Account",
        accountNumber: "12345678", balance: 1234.56, currency: "GBP"})
        @customer.accounts << @account
        @account2 = Account.new({accountName: "Reward Account",
        accountNumber: "11122233", balance: 1234.67, currency: "GBP"})
        @customer.accounts << @account2

        @transaction = Transaction.new({id:1010,
            transactionNumber: "00667788523",
            transactionDate: Date.new(2020,11,04),
            currency: "GBP",
            amount: 1000,
            description: "Refund",
            sendingAccount: @account,
            recievingAccount: @account2
        })
    end

    test "valid transaction with all fields entered" do
        assert @transaction.valid?
    end 

    test "valid transaction with amount being zero" do
        @transaction.amount = 0.00
        assert @transaction.valid?
    end

    test "valid transaction with amount being 100000000" do
        @transaction.amount = 100000000
        assert @transaction.valid?
    end

    test "invalid transaction with amount being outside of range" do
        @transaction.amount = 100000001
        assert_not @transaction.valid?
    end

    test "invalid transaction with negitive amount" do 
        @transaction.amount = -1.56
        assert_not @transaction.valid?
    end

    test "invalid transaction without a transactionNumber" do 
        @transaction.transactionNumber = ""
        assert_not @transaction.valid?
    end

    test "invalid transaction without a sending Account linked" do 
        @transaction.sendingAccount = nil
        assert_not @transaction.valid?
    end

    test "invalid transaction without a recieving Account linked" do 
        @transaction.recievingAccount = nil
        assert_not @transaction.valid?
    end

    test "invalid transaction without a desciription" do 
        @transaction.description = ""
        assert_not @transaction.valid?
    end

    test "invalid transaction with non unique transaction number" do 
        @duplicate = Transaction.new({id:1010,
            transactionNumber: "00667788523",
            transactionDate: Date.new(2020,11,04),
            currency: "GBP",
            amount: 1000,
            description: "Refund",
            sendingAccount: @account,
            recievingAccount: @account2
        })
        @duplicate.save
        assert_not @transaction.valid?
    end

    test "valid transaction with currency GBP" do 
        @transaction.currency = "GBP"
        assert @transaction.valid?
    end

    test "valid transaction with currency USD" do 
        @transaction.currency = "USD"
        assert @transaction.valid?
    end

    test "valid transaction with currency EUR" do 
        @transaction.currency = "EUR"
        assert @transaction.valid?
    end

    test "invalid transaction with no currency specified" do 
        @transaction.currency = ""
        assert_not @transaction.valid?
        @transaction.currency = nil
        assert_not @transaction.valid?
    end

    test "valid transaction with amount rounded" do 
        @transaction.amount = 234.567876050505
        assert @transaction.amount = 23.57
    end
end
