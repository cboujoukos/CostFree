class ActivitiesController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activity_path(@activity)
    else
      flash.now[:alert] = " You must enter a name and description of the activity"
      render "new"
    end
  end


  private

  def activity_params
    params.require(:activity).permit(:title, :description, :category_ids => [])
  end


end
