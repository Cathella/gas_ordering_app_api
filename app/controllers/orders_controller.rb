class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    render json: @order
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    @order.customer_id = current_user.id
    @order.status = "pending"

    if @product.inventory >= @order.quantity
      @product.inventory -= @order.quantity
      @product.save

      if @order.save
        render json: @order, status: :created
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "product out of stock" }, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @order.destroy
      render json: { message: "Order deleted successfully." }, status: :ok
    else
      render json: { message: "Failed to delete order." }, status: :unprocessable_entity
    end
  end

  def status
    @order = Order.find(params[:id])
    render json: { status: @order.status }
  end

  def history
    @orders = Order.where(customer_id: params[:customer_id])
    render json: @orders
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
  
  def order_params
    params.require(:order).permit(:quantity, :status, :product_id, :customer_id)
  end
end
