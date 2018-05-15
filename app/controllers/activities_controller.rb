class ActivitiesController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @activities = Activity.all
    respond_to do |f|
      f.html {render :index}
      f.json {render json: @activities, status: 200}
    end
  end

  def show
    @activity = Activity.find(params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @activity, status: 200}
    end
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

  def destroy
    @activity = Activity.find_by(id: params[:id])
    @activity.destroy
    redirect_to root_path
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

  def authorize
    unless current_user.try(:admin?) || current_user.id == Activity.find_by(id: params[:id]).user_id
      flash[:error] = "You are not authorized to view this page."
      redirect_back(fallback_location: root_path)
    end
  end

end
