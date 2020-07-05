class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    if params[:menu_id] && @menu= Menu.find_by(id: params[:menu_id])
      @menu_item= @menu.menu_items.build
    else
      redirect_to home_path
      flash[:message]= "Action not permitted."
    end
  end

  def create
    @menu= Menu.find_by(id: params[:menu_id])
    @menu_item= MenuItem.new(menu_item_params)
    if @menu_item.save
      redirect_to menu_menu_item_path(@menu, @menu_item)
    else
      render :new
    end
  end

  def edit
    redirect_to menus_path if @menu_item.menu.restaurant.user_id != session[:user_id]
    flash[:message]= "Action not permitted."
  end

  def update
    @menu_item.update(menu_item_params)
    if @menu_item.save
      redirect_to menu_menu_item_path(@menu_item.menu, @menu_item)
    else
      render :edit
    end
  end

  def destroy
    if @menu_item.menu.restaurant.user_id == session[:user_id]
      @menu_item.destroy
      redirect_to menus_path
    else
      redirect_to home_path
      flash[:message]="Action not permitted."
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
