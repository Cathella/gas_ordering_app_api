class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:status, :show, :update, :destroy]

  def index
    @deliveries = Delivery.all
    render json: @deliveries
  end

  def show
    render json: @delivery
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.calculate_fees

    if @delivery.save
      render json: @delivery, status: :created
    else
      render json: @delivery.errors, status: :unprocessable_entity
    end
  end

  def update
    if @delivery.update(delivery_params)
      render json: @delivery
    else
      render json: @delivery.errors, status: :unprocessable_entity
    end
  end

  private

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  def delivery_params
    params.require(:delivery).permit(:location, :fees, :status, :order_id)
  end
end
