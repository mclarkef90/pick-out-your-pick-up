class MenusController < ApplicationController
    before_action :set_menu, only: [:edit, :update, :destroy]

    def index
      redirect_if_not_logged_in
      @restaurants=Restaurant.all
      @menus= Menu.all
    end

    def new
      if params[:restaurant_id] && @restaurant= Restaurant.find_by(id: params[:restaurant_id])
          @menu= @restaurant.menus.build
      else
        redirect_to home_path
        flash[:message]= "Action not permitted."
      end
    end

    def create
      if params[:restaurant_id] && @restaurant= Restaurant.find_by(id: params[:restaurant_id])
        @menu= @restaurant.menus.build(menu_params)
        if @menu.save
          redirect_to restaurant_menu_path(@restaurant, @menu)
        else
          render :new
        end
      end
    end

    def edit
      redirect_to menus_path if @menu.restaurant.user_id != session[:user_id]
      flash[:message]= "Action not permitted."
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
      if @menu.restaurant.user_id == session[:user_id]
        @menu.destroy
        redirect_to menus_path
      else
        redirect_to home_path
        flash[:message]="Action not permitted."
      end
    end

    def show
      @menu= Menu.find_by(id: params[:id])
    end

    private

    def menu_params
      params.require(:menu).permit(
        :name,
        :restaurant_id,
        :category,
        :details
      )
    end

    def set_menu
      @menu= Menu.find_by(id: params[:id])
    end

  end
