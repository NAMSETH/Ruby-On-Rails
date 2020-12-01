class AccountsController < ApplicationController
  include AccountsHelper
  before_action :redirect_if_not_logged_in, only: [:index]
  def index
    @customer = Customer.find(1)
    @accounts = @customer.accounts
  end

  def show
  end

  def redirect_if_not_logged_in
    unless logged_in?
      redirect_to new_customer_path
    end
  end
end
