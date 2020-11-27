class TransactionController < ApplicationController
  def index
  end

  def show
  end

  def new
    @transaction = Transaction.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def delete
  end

  def destroy
  end
  def transaction_params
    params.require(:transaction).permit(:sendingAccount,
       :currency, :transactionDate)
     end
end
