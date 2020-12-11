module CustomerSessionHelper
  def log_in(customer)
    session[:customer_id] = customer.id
  end

  def current_user
    if session[:customer_id]
      Customer.find_by(id: session[:customer_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:customer_id)
    @current_customer = nil
  end

  def code_generate(mail)
    email = mail
    @code = rand 10000
    CodeMailer.new_code(@code.to_s,email).deliver_now
    return @code.to_s
  end
  
end
