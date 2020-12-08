class ApplicationController < ActionController::Base
  include ApplicationHelper
  include CustomerSessionHelper
  include AccountsHelper
  include CustomersHelper
  include AdminSessionsHelper
  include AdminUsersHelper
  include TransactionsHelper

  def redirect_if_not_logged_in
    unless logged_in?
      redirect_to customer_login_url
    end
  end

  def redirect_if_not_admin
    unless admin_logged_in?
      redirect_to admin_login_path
    end
  end

  def redirect_if_not_admin_or_customer
    unless logged_in? || admin_logged_in?
      redirect_to customer_login_url
    end
  end

end
