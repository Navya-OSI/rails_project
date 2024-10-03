class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
        @users = User.all
        @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create 
    @product = Product.new(product_params)
    if @product.save
      # incorporating job in controller that means enqueing a job
      #it was using the active job only
      SimpleJob.perform_now('world');
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


  def update
    
  end

  private
  def product_params
    params.require(:product).permit(:productId, :productName, :productDescription);
  end

end
