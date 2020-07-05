class RestaurantReviewsController < ApplicationController

  def home
    @restaurants= Restaurant.all
    @restaurant_reviews= RestaurantReview.all
  end

  def index
    if params[:restaurant_id] && @restaurant= Restaurant.find_by(id: params[:restaurant_id])
      @restaurant_reviews = @restaurant.restaurant_reviews
    elsif params[:user_id] && @user= User.find_by(id: params[:user_id])
      @restaurant_reviews= @user.restaurant_reviews
    else
    @restaurant_reviews= RestaurantReview.all
    end
  end

end
