class ReviewsController < ApplicationController

  before_action :require_login, only: [:new, :create]
  def index
    @reviews = Review.where(activity_id = params[:id])
  end

  def new
    @activity = Activity.find(params[:activity_id])
    @review = Review.new
  end

  def create
    binding.pry
    @review = Review.new(review_params)
    @activity = @review.activity
    if @review.save
      redirect_to @review.activity
    else
      render "new"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :activity_id)
  end
end
