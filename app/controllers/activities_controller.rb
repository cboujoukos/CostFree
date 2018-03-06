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
    @activity.build_location()
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activity_path(@activity)
    else
      flash.now[:alert] = "You must enter a name and description of the activity"
      render "new"
    end
  end

  def edit
    @activity = Activity.find_by(id: params[:id])
    @activity.build_location() unless @activity.location
  end

  def update
    @activity = Activity.find_by(id: params[:id])
    @activity.update(activity_params)
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render "edit"
    end
  end

  def most_popular
    with_null = Activity.no_reviews
    without_null = Activity.most_popular
    @activities = without_null + with_null
  end


  private

  def activity_params
    params.require(:activity).permit(:user_id, :title, :description, :suggested_duration, :category_ids => [], location_attributes: [:user_id, :street_address_1, :street_address_2, :city, :state, :zip_code, :country])
  end


end
