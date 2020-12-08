module AdminUsersHelper
include TransactionsHelper

  def createTransactionHistory(account)
    for i in 0..5 do
      newTransaction = Transaction.new(sendingAccount_id: account.id,
        transactionNumber: generateTransactionNumber,
        transactionDate: randomTime,
        sendingAccount_id: randomAccount, amount: randomAmount,
        currency: randomCurrency, description: " ")

      if newTransaction.valid?
        if processPayment(newTransaction)
            newTransaction.save
        else
          flash.alert = "Payment Unsuccessful"
        end
      end
    end

    for i in 0..5 do
      newTransaction = Transaction.new(recievingAccount_id: randomAccount,
        transactionNumber: generateTransactionNumber,
        transactionDate: randomTime,
        sendingAccount_id: account.id, amount: randomAmount,
        currency: randomCurrency, description: " ")

      if newTransaction.valid?
        if processPayment(newTransaction)
            newTransaction.save
        else
          flash.alert = "Payment Unsuccessful"
        end
      end

    end
  end

  # Based on https://stackoverflow.com/questions/4894198/how-to-generate-a-random-date-in-ruby
  def randomTime from = Time.local(2020, 11, 1), to = Time.now
    Time.at(from + rand * (to.to_f - from.to_f))
  end

  def randomAmount
    rand(1..300)
  end

  def randomAccount
    list = Account.all.ids
    list.sample
  end

  def randomCurrency
    ["GBP", "USD", "EUR"].sample
  end

end
