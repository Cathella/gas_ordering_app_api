class OrdersController < ApplicationController
  def index
  end

  def show
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
  end

  def destroy
  end

  def status
    @order = Order.find(params[:id])
    render json: { status: @order.status }
  end

  def history
    @orders = Order.where(customer_id: params[:customer_id])
    render json: @orders
  end
end
