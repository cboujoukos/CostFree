class PhotosController < ApplicationController
  def index
    @activity = Activity.find_by(id: params[:activity_id])
    @photos = @activity.photos
  end

  def new
    @photo = Photo.new
  end

  def create
    raise params.inspect
  end

  private
  def photo_params
    params.require(:photo).permit(:description)
  end
end
