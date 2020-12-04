class AccountsController < ApplicationController
  include AccountsHelper
  before_action :redirect_if_not_logged_in, only: [:index]

  def new
    @account = Account.new({:accountNumber => generateAccountNumber, balance: generateBalance})
  end

  def create
    @customer_account = Customer.find_by(:customerNumber => params[:customerNumber])
    @account = Account.new(account_params)
    @customer_account.accounts << @account
    if @account.save
      redirect_to(accounts_path)
    else
      render('new')
    end
  end

  def index
    @customer = current_user
    @accounts = @customer.accounts
  end

  def show
  end

  def showTransactions
  end

  def account_params
    params.require(:account).permit(:accountNumber,:accountName, :balance,
         :currency)
  end

end
