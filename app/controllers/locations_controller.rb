class LocationsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @locations = Location.all
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
    @location = Location.find_by(id: params[:id])
    respond_to do |f|
      f.json {render json: @location, include: ['activities', 'activities.*.reviews'], status: 201}
      f.html {render 'show'}
    end
  end

  def edit
    @location = Location.find_by(id: params[:id])
    @location.activities.build()
    @location.activities.build()
    @location.activities.build()
  end

  def update
    @location = Location.find_by(id: params[:id])
    @location.update(location_params)
    if @location.save
      redirect_to location_path(@location)
    else
      render "edit"
    end
  end

  def new_activity
    @location = Location.find_by(id: params[:id])
    @activity = Activity.new
  end

  private

  def location_params
    params.require(:location).permit(
      :user_id,
      :street_address_1,
      :street_address_2,
      :city,
      :state,
      :zip_code,
      :country,
      :activities_attributes => [
        :id,
        :user_id,
        :title,
        :description,
        :suggested_duration,
        :category_ids => []
      ]
    )
  end
#params =  {
#  "utf8"=>"✓",
#  "authenticity_token"=>"m9dOE7R8Ny7+M1OqmE5dPbth2X0veU+Kc78AkzeDKC/lsvQi6nDTptx+Zwy3mNS#52KzAvEY/N+W/UH9J/rFEZQ==",
#  "location"=>{
#    "street_address_1"=>"999 Josephine St",
#    "street_address_2"=>"",
#    "city"=>"Flanders",
#    "state"=>"IL",
#    "zip_code"=>"76432",
#    "country"=>"United States",
#    "activities_attributes"=>{
#      "0"=>{
#        "title"=>"Ham Party",
#        "description"=>"Free ham based products every Tuesday",
#        "category_ids"=>["", "11", "12"]
#        },
#      "1"=>{
#        "title"=>"",
#        "description"=>"",
#        "category_ids"=>[""]
#        },
#      "2"=>{
#        "title"=>"",
#        "description"=>"",
#        "category_ids"=>[""]
#        }
#      }
#    },
#    "commit"=>"Create Location",
#    "controller"=>"locations",
#    "action"=>"create"
#  }

end
