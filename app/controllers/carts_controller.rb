class CartsController < ApplicationController

  def new
    @cart= Cart.new
    @cart.user_id= current_user.id
    redirect_to restaurants_path
  end

  def create
    @cart= Cart.new(cart_params)
    if @cart.save
      redirect_to cart_path(@cart)
    else
      render :new
    end
  end

  private

  def cart_params
    params.require(:cart).permit(
      :user_id,
      :ordered,
      :fulfilled,
    )
  end

end
