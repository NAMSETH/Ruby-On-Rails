class ApplicationController < ActionController::Base
  include ApplicationHelper
  include CustomerSessionHelper
  include AccountsHelper
  include CustomersHelper

  def redirect_if_not_logged_in
    unless logged_in?
      redirect_to customer_login_url
    end
  end
end
