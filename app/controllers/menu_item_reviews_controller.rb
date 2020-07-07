class MenuItemReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_menu_item, only: [:index, :new, :create, :show]
  before_action :set_menu_item_review, only: [:edit, :update, :destroy, :show]

  def index
    #only available as nested route under menu_items
    @menu_item_reviews = @menu_item.menu_item_reviews
  end

  def new
    #only available as nested route under menu_items
    @menu_item_review= @menu_item.menu_item_reviews.build
  end

  def create
    #only available as nested route under menu_items
    @menu_item_review= MenuItemReview.new(menu_item_review_params)
    if @menu_item_review.save
      redirect_to reviews_home_path
    else
      render :new
    end
  end

  def edit
    if !@menu_item_review || @menu_item_review.user_id != current_user.id
      redirect_to reviews_home_path
      flash[:message]= "Action not permitted. You did not write this review."
    end
  end

  def update
    @menu_item_review.update(menu_item_review_params)
    if @menu_item_review.save
      redirect_to reviews_home_path
    else
      render :edit
    end
  end

  def destroy
    if @menu_item_review.user_id != session[:user_id]
      redirect_to reviews_home_path
      flash[:message]= "Action not permitted. You did not write this review."
    else
      @menu_item_review.destroy
      redirect_to reviews_home_path
    end
  end

  def show
  end

  private

  def menu_item_review_params
    params.require(:menu_item_review).permit(
      :user_id,
      :menu_item_id,
      :rating,
      :comment
    )
  end

  def set_menu_item
    @menu_item= MenuItem.find_by(id: params[:menu_item_id])
  end

  def set_menu_item_review
    @menu_item_review= MenuItemReview.find_by(id: params[:id])
  end

end
