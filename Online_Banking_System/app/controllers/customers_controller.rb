class CustomersController < ApplicationController
  include CustomersHelper
  def index
    @customer = Customer.find(1)
    @accounts = @customer.accounts
    puts @accounts.empty?
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
