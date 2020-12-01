module CustomersHelper

  def generateCustomerNumber
    generatedValue = rand(100000000..999999999)
    if (Customer.where(customerNumber: generatedValue).count > 0)
      generateCustomerNumber
    else
      generatedValue

    end
  end

end
