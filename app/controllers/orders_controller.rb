class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    @product = Product.find(params[:product_id])
    @order.user = current_user
    @order.product = @product

    if @order.save
      @product.disponibility -= 1
      @product.save
      redirect_to @order, notice: 'product was successfully updated.'
    else
      redirect_to @product, alert: 'Error creating order'
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
