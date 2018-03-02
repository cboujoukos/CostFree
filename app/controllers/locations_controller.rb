class LocationsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
  end

  def new
    @location = Location.new
    @location.activities.build()
    @location.activities.build()
    @location.activities.build()
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location
    else
      render "new"
    end
  end

  def show
    @location = Location.find_by(params[:id])
  end

  private

  def location_params
    params.require(:location).permit(
      :street_address_1,
      :street_address_2,
      :city,
      :state,
      :zip_code,
      :country,
      activities_attributes: [
        :title,
        :description,
        :suggested_duration,
        :category_ids => []
      ]
    )
  end

end
