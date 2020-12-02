class TransactionsController < ApplicationController
  def index
    @account = Account.find(params[:account_id])
    id  = @account.id
    @transactions = Transaction.where(sendingAccount_id: id).or(Transaction.where(recievingAccount_id: id))
  end
end
