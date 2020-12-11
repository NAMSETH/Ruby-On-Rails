class CustomerSessionController < ApplicationController
before_action :redirect_if_logged_in, only: [:new, :create]

  @@code = ""

  def new
  end

  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer && customer.authenticate(params[:session][:password])
      log_in(customer)
      if(customer.verification == true)
        @@code = code_generate(params[:session][:email])
        newVerification
      else
        redirect_to(accounts_path)
      end  
    else
      flash.now[:danger] = "No valid credentials were provided"
      render 'new'
    end
  end

  def newVerification
    render 'verification'
    
  end

  def verification
    code = params[:session][:code]
    if code == @@code
      redirect_to(accounts_path)
    else
      flash.now[:danger] = "Invalid Code Submitted"
      render 'verification'
    end
  end
  
  

  def destroy
    log_out
    redirect_to(root_url)
  end
end
