module CustomerSessionHelper
  def log_in(customer)
    session[:customer_id] = customer.id
  end

  def current_user
    if session[:user_id]
      Customer.find_by(id: session[:customer_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
  end
end
