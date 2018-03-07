class ReviewsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]
  # before_action :authorized?, only: [:edit, :update, :delete]

  def index
    @reviews = Review.where(activity_id = params[:id])
  end

  def new
    @activity = Activity.find(params[:activity_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @activity = @review.activity
    if @review.save
      redirect_to @review.activity
    else
      render "new"
    end
  end

  def edit
    @activity = Activity.find_by(id: params[:activity_id])
    @review = Review.find_by(id: params[:id])
  end

  def update
    @activity = Activity.find_by(id: params[:activity_id])
    @review = Review.find_by(id: params[:id])
    @review.update(review_params)
    if @review.save
      redirect_to @review.activity
    else
      render "edit"
    end
  end

  def destroy
    raise params.inspect
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :activity_id, :title)
  end

  def authorized?
    if current_user != Review.find_by(params[:id]).user
      flash[:error] = "You may only edit reviews that you created"
      redirect_back(fallback_location: root_path)
    end
  end

end
