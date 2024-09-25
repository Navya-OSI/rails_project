class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
        @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create 
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product was Successfully registered'
      redirect_to products_path
    else
      flash[:alert] = 'Unable to register Product'
      render :new
    end
  end


  def show
    @product = Product.find(params[:id]);
    respond_to do |format|
      format.html
      format.json {render json: @product}
    end
  end


  private
  def product_params
    params.require(:product).permit(:productId, :productName, :productDescription);
  end

end
