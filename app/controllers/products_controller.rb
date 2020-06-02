class ProductsController < ApplicationController

  def index
    @product = Product.all
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
    @product = Product.find params[:id]
    respond_to do |format|
      if @product.update product_params
         ...
      end
    end
 end

 private

 def product_params
   params.require(:products).permit(:name, :category, :description, food_images_attributes: [:id, :product_id, :avatar]) #-> this is enough (no need to "whitelist")
 end
end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to cocktail_path(@product.cocktail)
  end

  private

  def product_params
    params.require(:product).permit(:description, :user_id)
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
    params.require(:product).permit(:name)
    
  end
end


end
