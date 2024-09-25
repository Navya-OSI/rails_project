class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @products = Product.all
  end

  def create 
    @review = Review.new(review_params)
    @products = Product.all 
    if @review.save
      flash[:notice] = 'review successfully submitted'
      redirect_to reviews_path
    else
      flash[:alert] = 'unable to submit review'
      render :new
    end
  end


  def show
    @review = Review.find(params[:id]);
    respond_to do |format|
      format.html
      format.json {render json: @review}
    end
  end


  private
  def review_params
    params.require(:review).permit(:comment, :product_id);
  end
end
