class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

  def new
    if params[:menu_id] && @menu= Menu.find_by(id: params[:menu_id])
      if @menu.restaurant.user_id == current_user.id
        @menu_item= @menu.menu_items.build
      else
        redirect_to home_path
        flash[:message]= "Action not permitted. You are not the restaurant owner."
      end
    end
  end

  def create
    @menu= Menu.find_by(id: params[:menu_id])
    @menu_item= MenuItem.new(menu_item_params)
    if @menu_item.save
      redirect_to restaurant_menu_path(@menu.restaurant, @menu)
    else
      render :new
    end
  end

  def edit
    if @menu_item.menu.restaurant.user_id != current_user.id
      redirect_to menus_path
      flash[:message]= "Action not permitted. You are not the restaurant owner."
    end
  end

  def update
    @menu_item.update(menu_item_params)
    if @menu_item.save
      redirect_to restaurant_menu_path(@menu_item.menu.restaurant, @menu_item.menu)
    else
      render :edit
    end
  end

  def destroy
    if @menu_item.menu.restaurant.user_id != current_user.id
      redirect_to home_path
      flash[:message]="Action not permitted. You are not the restaurant owner."
    else
      @menu_item.destroy
      redirect_to restaurant_menu_path(@menu_item.menu.restaurant, @menu_item.menu)
    end
  end

  def show
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(
        :name,
        :description,
        :price,
        :chef_specialty,
        :vegan,
        :menu_id,
        :available
    )
  end

  def set_menu_item
    @menu_item= MenuItem.find_by(id: params[:id])
  end

end
