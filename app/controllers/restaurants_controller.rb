class RestaurantsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants= Restaurant.alpha.all
    @restaurants = @restaurants.search(params[:q].downcase) if params[:q] && !params[:q].empty?
    @restaurants = @restaurants.genrefilter(params[:restaurant][:genre_id]) if params[:restaurant] && params[:restaurant][:genre_id] != ""
  end

  def new
    if current_user.restaurant_owner?
      @restaurant= Restaurant.new
    else
      redirect_to home_path
      flash[:message]= "Action not permitted."
    end
  end

  def create
    @restaurant= Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    redirect_to restaurants_path if !@restaurant || @restaurant.user_id != session[:user_id]
    flash[:message]= "Action not permitted."
  end

  def update
    @restaurant.update(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    if @restaurant.user_id = current_user.id
      @restaurant.destroy
      redirect_to restaurants_path
    else
      redirect_to home_path
      flash[:message]="Action not permitted."
    end
  end

  def show
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :address_one,
      :address_two,
      :city,
      :state,
      :zipcode,
      :genre_id,
      :user_id
    )
  end

  def set_restaurant
    @restaurant= Restaurant.find_by(id: params[:id])
  end

end
