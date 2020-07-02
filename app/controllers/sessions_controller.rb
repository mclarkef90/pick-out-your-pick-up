class SessionsController < ApplicationController

  def create
    user= User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Sign in not found. Please enter valid email and password."
      redirect_to "/signin"
    end
  end

    def destroy
      session.delete("user_id")
      redirect_to home_path
    end

    def omniauth
      @user= User.find_or_create_by(email: auth["info"]["email"]) do |user|
        user.first_name= auth["info"]["first_name"]
        user.last_name= auth["info"]["last_name"]
        user.password= SecureRandom.hex(10)
      end
      if @user.save
        session[:user_id]= @user.id
        redirect_to user_path(@user)
      else
        flash[:message]= "Google sign in/sign up did not work."
        redirect_to home_path
      end
    end

    private

    def auth
      request.env['omniauth.auth']
    end
end
