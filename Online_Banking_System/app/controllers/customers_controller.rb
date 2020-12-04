class CustomersController < ApplicationController
  include CustomersHelper
  before_action :redirect_if_not_logged_in, only: [:edit, :update]

  def new
    @customer = Customer.new({:customerNumber => generateCustomerNumber})
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.valid?
      @customer.save
      redirect_to(customer_login_url)
    else
      render('new')
    end
  end

  def update
    @customer = Customer.find(params[:id])
    puts @customer
    if @customer.update_attributes(customer_params)
      redirect_to accounts_path
    else
      render 'edit'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:customerNumber,:forename, :surname,
       :email, :phone, :email, :dob, :password, :password_confirmation)
  end

end
