class PhotosController < ApplicationController
  def index
    @activity = Activity.find_by(id: params[:activity_id])
    @photos = @activity.photos
  end

  def new
    @activity = Activity.find_by(id: params[:activity_id])
    @photo = Photo.new
  end

  def create
    @activity = Activity.find_by(id: params[:activity_id])
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to @activity
    else
      render "new"
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:description, :activity_id, :image, :user_id)
  end
end
