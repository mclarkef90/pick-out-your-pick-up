class RestaurantsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @restaurants= Restaurant.all
  end

  def new
    if current_user.restaurant_owner?
      @restaurant= Restaurant.new
    else
      redirect_to home_path
      flash[:message]= "Access not permitted."
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
  end

  def update
  end

  def destroy
  end

  def show
    @restaurant= Restaurant.find_by(id: params[:id])
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
    )
  end

end
