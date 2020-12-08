module AccountsHelper
  def generateAccountNumber
    accountNumber = rand(1000000000000000..9999999999999999)
  end

  def generateBalance
    balance = rand(100..100000)
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

end
