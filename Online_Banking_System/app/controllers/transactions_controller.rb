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
      @transaction = Transaction.sendMoney(payment_params)
  end

  def sendMoney
  end

  def update
  end

  def edit
  end

  def delete
  end

  def destroy
  end

  private
  def payment_params
    params.require( :transaction).permit(:sendingAccount,:recievingAccount,:amount,
:currency, :transactionNumber, :paymentDate)
     end
end
