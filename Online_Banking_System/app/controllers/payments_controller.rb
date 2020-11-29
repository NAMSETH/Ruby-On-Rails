class PaymentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
      @payment = Payment.new(payment_params)
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
    params.require(:payment).permit(:recievingAccount,
:currency,:sumSended, :paymentDate)
     end
end
