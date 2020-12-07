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
  end

  def create
    @account= Account.where(accountNumber: :sendingAccount)
    params[:transaction][:sendingAccount]= @account
    params[:transaction][:recievingAccount] =  Account.where(accountNumber: :recievingAccount)
    @transaction = Transaction.new(payment_params)
    if @transaction.valid?
      @transaction.sendingAccount.balance= @transaction.sendingAccount.balance - @transaction.amount
      @transaction.recievingAccount.balance= @transaction.recievingAccount.balance - @transaction.amount
      @transaction.save
    else
      render('create')
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
    params.require( :transaction).permit(:sendingAccount,:recievingAccount,:amount,
:currency, :transactionNumber)
     end
end
