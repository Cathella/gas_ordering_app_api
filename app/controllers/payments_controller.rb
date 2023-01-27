class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :update]

  def show
    render json: @payment
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.calculate_total_amount

    if @payment.save
      render json: @payment, status: :created, location: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @payment.update(payment_params)
      render json: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  private

    def set_payment
      @payment = Payment.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit(:method, :status, :total_amount, :order_id, :delivery_id)
    end
end
