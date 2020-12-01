module AccountsHelper

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
