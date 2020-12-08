class AdminCustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      redirect_to admin_customers_path
    else
      redirect_to 'admin_customers/edit'
    end
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
