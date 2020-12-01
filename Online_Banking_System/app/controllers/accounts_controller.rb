class AccountsController < ApplicationController
  include AccountsHelper
  before_action :redirect_if_not_logged_in, only: [:index]
  def new
    @account = Account.new({:accountNumber => generateAccountNumber)
  end

  def
  def index
    @customer = current_user
    @accounts = @customer.accounts
  end

  def show
  end

  def redirect_if_not_logged_in
    unless logged_in?
      redirect_to customer_login_url
    end
  end
end
