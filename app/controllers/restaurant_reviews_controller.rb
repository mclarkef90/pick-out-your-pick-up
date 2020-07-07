class RestaurantReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_restaurant, only: [:index, :new, :create]
  before_action :set_restaurant_review, only: [:edit, :update, :delete]

  def index
    #only available as nested route under restaurant
    @restaurant_reviews = @restaurant.restaurant_reviews.newest
  end

  def new
    #only available as nested route under restaurant
      @restaurant_review= @restaurant.restaurant_reviews.build
  end

  def create
    #only available as nested route under restaurant
    @restaurant_review= RestaurantReview.new(restaurant_review_params)
    if @restaurant_review.save
      redirect_to restaurant_restaurant_reviews_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    if !@restaurant_review || @restaurant_review.user_id != current_user.id
      redirect_to restaurants_path
      flash[:message]= "Action not permitted. You did not write this review."
    end
  end

  def update
    @restaurant_review.update(restaurant_review_params)
    if @restaurant_review.save
      redirect_to reviews_home_path
    else
      render :edit
    end
  end

  def destroy
    if @restaurant_review.user_id != current_user.id
      redirect_to home_path
      flash[:message]= "Action not permitted. You did not write this review."
    else
      @restaurant_review.destroy
      redirect_to reviews_home_path
    end
  end

  #custom
  def home
  end

  private

  def restaurant_review_params
    params.require(:restaurant_review).permit(
      :user_id,
      :restaurant_id,
      :rating,
      :comment
    )
  end

  def set_restaurant
    @restaurant= Restaurant.find_by(id: params[:restaurant_id])
  end

  def set_restaurant_review
    @restaurant_review= RestaurantReview.find_by(id: params[:id])
  end
end
