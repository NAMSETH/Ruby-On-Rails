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


  def findAccountIdFromAccountNumber(accountNumber)
    @account = Account.where(accountNumber: accountNumber)
  end

end
