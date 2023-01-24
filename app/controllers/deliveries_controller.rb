class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:status]

  def index
    @deliveries = Delivery.all
    render json: @deliveries
  end

  def show
  end

  def create
  end

  def update
  end

  def status
    render json: { status: @delivery.status }
  end

  private

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  def delivery_params
    params.require(:delivery).permit(:location, :phone, :status)
  end
end
