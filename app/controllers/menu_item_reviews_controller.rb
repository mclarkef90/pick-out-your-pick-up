class MenuItemReviewsController < ApplicationController

  def index
    if params[:menu_item_id] && @menu_item= MenuItem.find_by(id: params[:menu_item_id])
      @menu_item_reviews = @menu_item.menu_item_reviews
    elsif params[:user_id] && @user= User.find_by(id: params[:user_id])
      @menu_item_reviews= @user.menu_item_reviews
    
    else
      @menu_item_reviews= MenuItemReview.all
    end
  end

  def new
    if params[:menu_item_id] && @menu_item= MenuItem.find_by(id: params[:menu_item_id])
      @menu_item_review= @menu_item.menu_item_reviews.build
    else params[:user_id] && @user= User.find_by(id: params[:user_id])
      @menu_item_review= @user.menu_item_reviews.build
    end
  end

  def create
    @menu_item= MenuItem.find_by(id: params[:menu_item_id])
    @menu_item_review= MenuItemReview.new(menu_item_review_params)
    if @menu_item_review.save
      redirect_to menu_item_menu_item_review_path(@menu_item, @menu_item_review)
    else
      render :new
    end
  end

  def edit
    @menu_item_review= MenuItemReview.find_by(id: params[:id])
  end

  def update
    @menu_item_review= MenuItemReview.find_by(id: params[:id])
    @menu_item_review.update(menu_item_review_params)
    if @menu_item_review.save
      redirect_to menu_item_menu_item_review_path(@menu_item_review.menu_item, @menu_item_review)
    else
      render :edit
    end
  end

  def destroy
    @menu_item_review= MenuItemReview.find_by(id: params[:id])
    if @menu_item_review.user_id == session[:user_id]
      @menu_item_review.destroy
      redirect_to user_menu_item_reviews_path(current_user.id)
    else
      redirect_to home_path
      flash[:message]="Action not permitted."
    end
  end

  def show
    @menu_item= MenuItem.find_by(id: params[:menu_item_id])
    @menu_item_review= MenuItemReview.find_by(id: params[:id])
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

end
