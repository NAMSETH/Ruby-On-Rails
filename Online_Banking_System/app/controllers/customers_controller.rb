class CustomersController < ApplicationController
  include CustomersHelper
  before_action :redirect_if_not_admin_or_customer, only: [:edit, :update]

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
    if @customer.update_attributes(customer_params)
      if logged_in?
        redirect_to accounts_path
      else
        redirect_to customers_path
      end
    else
      render 'edit'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def index
      @customers = Customer.all
  end

  def show
    redirect_to customers_path
  end

  def customer_params
    params.require(:customer).permit(:customerNumber,:forename, :surname,
       :email, :phone, :email, :dob, :password, :password_confirmation)
  end

end
