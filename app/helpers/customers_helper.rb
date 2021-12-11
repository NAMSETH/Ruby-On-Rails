module CustomersHelper

  def generateCustomerNumber
    generatedValue = rand(100000001..999999999)
    if (Customer.where(customerNumber: generatedValue).count > 0)
      generateCustomerNumber
    else
      generatedValue
    end
  end

end
