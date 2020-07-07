class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :show]

  def new
    @user= User.new
  end

  def create
    @user= User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "New Account Successfully Created!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    redirect_to home_path if !@user || @user.id != current_user.id
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    if !@user || @user.id != current_user.id
      redirect_to home_path
    else @user.destroy
        redirect_to home_path
    end
  end

  def show
    redirect_to home_path if !@user || @user.id != session[:user_id]
  end

  def owner_home
    @restaurants= current_user.restaurants.all
  end

  def reviews
    @restaurant_reviews= current_user.restaurant_reviews.all
    @menu_item_reviews= current_user.menu_item_reviews.all
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def set_user
    @user= User.find_by(id: params[:id])
  end

end
