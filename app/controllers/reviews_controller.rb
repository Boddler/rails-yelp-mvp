class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # redirect_to restaurant_path(@restaurant)
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = review_params
    @review.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
