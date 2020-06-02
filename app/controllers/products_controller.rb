class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
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
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to product_path(@product.product)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  private

  def product_params
    params.require(:products).permit(:title, :category, :description, :price, :localization, :disponibility, [:id, :product_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
