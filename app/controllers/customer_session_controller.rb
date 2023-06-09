class CustomerSessionController < ApplicationController
before_action :redirect_if_logged_in, only: [:new, :create]

  def new
  end

  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer && customer.authenticate(params[:session][:password])
      log_in(customer)
      redirect_to(accounts_path)
    else
      flash.now[:danger] = "No valid credentials were provided"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to(root_url)
  end
end
