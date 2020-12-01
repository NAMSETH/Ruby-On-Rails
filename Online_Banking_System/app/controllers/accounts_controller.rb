class AccountsController < ApplicationController
  include AccountsHelper
  def index
    @customer = Customer.find(1)
    @accounts = @customer.accounts
  end

  def show
  end
end
