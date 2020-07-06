class UsersController < ApplicationController


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

  def show
    redirect_if_not_logged_in
    @user= User.find_by(id: params[:id])
    redirect_to home_path if !@user
  end

  def owner_home
    @restaurants= current_user.restaurants.all
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

end
