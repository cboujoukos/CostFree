class LocationsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    @location = Location.new
    @location.activities.build()
    @location.activities.build()
    @location.activities.build()
  end

  def create
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
        :suggested_duration
      ]
    )
  end

end
