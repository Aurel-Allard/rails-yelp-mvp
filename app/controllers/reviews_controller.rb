class ReviewsController < ApplicationController
  before_action :set_review, only: [:show]
  def index
    @reviews = Review.where(restaurant: Restaurant.find(params[:restaurant_id]))
  end
  def new
    # we need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end
  def show
  end
  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @review.save
    redirect_to review_path(@review)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
