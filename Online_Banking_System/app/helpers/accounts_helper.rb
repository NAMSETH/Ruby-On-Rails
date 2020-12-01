module AccountsHelper
  def formatBalance(account)
    formattedString = ""
    if (account.currency == "GBP")
      formattedString = "£"
    else if (account.currency == "EUR")
      formattedString = "€"
    else
      formattedString = "$"
   end
   formattedString = formattedString + "#{account.balance}"
 end
end
end
