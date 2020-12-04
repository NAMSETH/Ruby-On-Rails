class TransactionsController < ApplicationController
  include TransactionsHelper
  before_action :redirect_if_not_logged_in, only: [:index]
  def index
    @account = Account.find(params[:account_id])
    id  = @account.id
    @transactions = Transaction.where(sendingAccount_id: id).or(Transaction.where(recievingAccount_id: id))
  end
end
