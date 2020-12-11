class AccountsController < ApplicationController
  include AccountsHelper, CustomerSessionHelper
    before_action :redirect_if_not_admin_or_customer, only: [:index]
    before_action :redirect_if_not_admin, only: [:new, :create, :show]

  def new
    @account = Account.new({:accountNumber => generateAccountNumber,
      balance: generateBalance})
  end

  def create
    @customer_account = Customer.find_by(:customerNumber => params[:customerNumber].strip)
    @account = Account.new(account_params)
    @customer_account.accounts << @account
    if @account.valid? && generateTransactionHistory(@account)
        @account.save
        redirect_to(admin_users_path)
    else
      render('new')
    end
  end

  def show
    begin
      @customer = Customer.find(params[:id])
      @accounts = @customer.accounts
    rescue ActiveRecord::RecordNotFound
      redirect_to customers_path
    end
  end

  def index
    @customer = current_user
    @accounts = @customer.accounts
  end

  def delete
    @account = Account.find(params[:id])
    @customer = Customer.find_by(id: @account.customer_id)
    @account.destroy
    transactions = Transaction.where(sendingAccount_id: @account.id).or(Transaction.where(recievingAccount_id: @account.id))
    transactions.destroy_all
    redirect_to account_path(@customer)
  end

  def account_params
    params.require(:account).permit(:accountNumber,:accountName, :balance,
         :currency)
  end

end
