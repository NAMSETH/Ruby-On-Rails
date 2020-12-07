class TransactionsController < ApplicationController
  include TransactionsHelper
  before_action :redirect_if_not_logged_in, only: [:index]
  def index
    @account = Account.find(params[:account_id])
    id  = @account.id
    @transactions = Transaction.where(sendingAccount_id: id).or(Transaction.where(recievingAccount_id: id))
  end

  def show
  end

  def new
    @account = Account.find(params[:account_id]) # Get Sending Account
    @transaction = Transaction.new({sendingAccount_id: params[:account_id]})
  end

  def create
    @recievingAccounts = Account.where(accountNumber: payment_params[:recievingAccount_id])
    @recievingAccount = @recievingAccounts.first
    if @recievingAccount.nil?
      flash.alert = "Recipient Account number not found!"
      redirect_to(new_transaction_path(account_id: payment_params[:sendingAccount_id]))
    else
      @id = @recievingAccount.id
        flash.alert = @id
        @transaction = Transaction.new({
          amount: payment_params[:amount], transactionNumber: payment_params[:transactionNumber],
          currency: payment_params[:currency], sendingAccount_id: payment_params[:sendingAccount_id],
          recievingAccount_id: @id, transactionNumber: payment_params[:transactionNumber]
          })
          @transaction.save
          redirect_to accounts_path

    end


  end

  def update
  end

  def edit
  end

  def delete
  end

  def destroy
  end

  def payment_params
    params.require(:transaction).permit(:sendingAccount_id, :recievingAccount_id, :amount, :currency, :transactionNumber)
     end
end
