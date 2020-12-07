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
    formattedAmount = "#{transaction.amount}"
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
    formattedBalance = "#{account.balance}"
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

end
