module CustomersHelper

  def generateCustomerNumber
    generatedValue = rand(100000000..999999999)
    if (Customer.where(customerNumber: generatedValue).count > 0)
      generateCustomerNumber
    else
      generatedValue

    end
  end


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
