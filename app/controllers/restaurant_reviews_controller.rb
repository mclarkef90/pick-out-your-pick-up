class RestaurantReviewsController < ApplicationController

  def home
    
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

  def new

    if params[:restaurant_id] && @restaurant= Restaurant.find_by(id: params[:restaurant_id])
      @restaurant_review= @restaurant.restaurant_reviews.build
    else params[:user_id] && @user= User.find_by(id: params[:user_id])
      @restaurant_review= @user.restaurant_reviews.build
    end
  end

  def create
    @restaurant= Restaurant.find_by(id: params[:restaurant_id])
    @restaurant_review= RestaurantReview.new(restaurant_review_params)
    if @restaurant_review.save
      redirect_to restaurant_restaurant_review_path(@restaurant, @restaurant_review)
    else
      render :new
    end
  end

  def edit
    @restaurant_review= RestaurantReview.find_by(id: params[:id])
  end

  def update
    @restaurant_review= RestaurantReview.find_by(id: params[:id])
    @restaurant_review.update(restaurant_review_params)
    if @restaurant_review.save
      redirect_to restaurant_restaurant_review_path(@restaurant_review.restaurant, @restaurant_review)
    else
      render :edit
    end
  end

  def destroy
    @restaurant_review= RestaurantReview.find_by(id: params[:id])
    if @restaurant_review.user_id == session[:user_id]
      @restaurant_review.destroy
      redirect_to user_restaurant_reviews_path(current_user.id)
    else
      redirect_to home_path
      flash[:message]="Action not permitted."
    end
  end

  def show
    @restaurant= Restaurant.find_by(id: params[:restaurant_id])
    @restaurant_review= RestaurantReview.find_by(id: params[:restaurant_review_id])
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
end
