class CustomersController < ApplicationController
  include CustomersHelper
  def index
    @account = Account.new({accountNumber: 12345678, accountName: "Reward Current Account", balance: 10000, currency: "GBP"})
    @account.save
    @customer = Customer.find(1)
    @customer.accounts << @account
  end

  def show
  end

  def new
    @customer = Customer.new({:customerNumber => generateCustomerNumber})
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to(customers_path)
    else
      render('new')
    end
  end

  def update
  end

  def edit
  end

  def delete
  end

  def destroy
  end

  def customer_params
    params.require(:customer).permit(:customerNumber,:forename, :surname,
       :email, :phone, :email, :dob, :password, :password_confirmation)
  end
end
