class UsersController < ApplicationController
  before_action :set_and_verify_user, only: [:edit, :update, :destroy, :show]

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
    @user.destroy
        redirect_to home_path
  end

  def show
  end

  #Custom

  def owner_home
    redirect_if_not_logged_in
    @restaurants= current_user.restaurants.all
  end

  def reviews
    redirect_if_not_logged_in
    @restaurant_reviews= current_user.restaurant_reviews.newest.all
    @menu_item_reviews= current_user.menu_item_reviews.newest.all
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

  def set_and_verify_user
    @user= User.find_by(id: params[:id])
    if !@user || @user != current_user
      redirect_to home_path
      flash[:message] = "Action not permitted. You do not own this account."
    end
  end

end
