module TransactionsHelper

  def formatAmount(transaction)
    formatString = ""
    if (transaction.currency == "GBP")
      formatString = "£"
    elsif (transaction.currency == "EUR")
      formatString = "€"
    else
      formatString = "$"
    end
    formattedAmount = '%.2f' % transaction.amount
    formatString = formatString + formattedAmount
  end

  def formatBalance(account)
    formatString = ""
    if (account.currency == "GBP")
      formatString = "£"
    elsif (account.currency == "EUR")
      formatString = "€"
    else
      formatString = "$"
    end
    formattedBalance = '%.2f' % account.balance
    formatString = formatString + formattedBalance
  end


  def generateTransactionNumber
    generatedValue = rand(100000000..999999999)
    if (Transaction.where(transactionNumber: generatedValue).count > 0)
      generateTransactionNumber
    else
      generatedValue
    end
  end

  def processPayment(transaction)
    sendingAccount = Account.find(transaction.sendingAccount_id)
    recievingAccount = Account.find(transaction.recievingAccount_id)
    sendingAccount.balance = sendingAccount.balance - transaction.amount
    recievingAccount.balance = recievingAccount.balance + transaction.amount
    if sendingAccount.balance < 0 || recievingAccount.balance < 0
      false
    end
    if sendingAccount.valid? && recievingAccount.valid?
        sendingAccount.save
        recievingAccount.save
      true
    else
      false
    end
  end

  def getAccountName(transaction, sending)
    if sending
      Account.find(transaction.recievingAccount_id).accountName
    else
      Account.find(transaction.sendingAccount_id).accountName
    end
  end

end
