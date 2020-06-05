class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.where('disponibility > 0')
    

    @markers = @products.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { product: product })
      }
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def edit 

  end

  def new
    @product = Product.new
  end
  
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Deleted!'
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to @product, notice: 'Create Sucessfully'
    else
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:localization, :disponibility, :price, :category, :title, :description, :photo)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
