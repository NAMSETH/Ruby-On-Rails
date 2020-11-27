class CustomerSessionController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer && customer.authenticate(params[:session][:password])
      log_in(customer)
      redirect_to(customers_path)
    else
      render 'new'
    end
  end

  def destroy

  end
end
