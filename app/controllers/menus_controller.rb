class MenusController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_restaurant, only: [:new, :create, :show]
  before_action :set_menu, only: [:edit, :update, :destroy, :show]

  def new
    #only available as nested route under restaurant
      if @restaurant.user_id == current_user.id
        @menu= @restaurant.menus.build
      else
        redirect_to home_path
        flash[:message]= "Action not permitted. You are not the restaurant owner."
      end
  end

  def create
    #only available as nested route under restaurant
    @menu= @restaurant.menus.build(menu_params)
    if @menu.save
      redirect_to restaurant_menu_path(@restaurant, @menu)
    else
      render :new
    end
  end

  def edit
    if !@menu || @menu.restaurant.user_id != current_user.id
      redirect_to owner_home_path
      flash[:message]= "Action not permitted. You are not the restaurant owner."
    end
  end

  def update
    @menu.update(menu_params)
    if @menu.save
      redirect_to restaurant_menu_path(@menu.restaurant, @menu)
    else
      render :edit
    end
  end

  def destroy
    if @menu.restaurant.user_id != current_user.id
      redirect_to home_path
      flash[:message]="Action not permitted. You are not the restaurant owner."
    else
      @menu.destroy
      redirect_to owner_home_path
    end
  end

  def show
  end

  private

  def menu_params
    params.require(:menu).permit(
      :name,
      :restaurant_id,
      :details
    )
  end

  def set_restaurant
    @restaurant= Restaurant.find_by(id: params[:restaurant_id])
  end

  def set_menu
    @menu= Menu.find_by(id: params[:id])
  end

end
