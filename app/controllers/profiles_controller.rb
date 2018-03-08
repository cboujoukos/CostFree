class ProfilesController < ApplicationController

  def show
    @user = User.find_by(id: params[:user_id])
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @profile = Profile.new
  end

  def create
    raise params.inspect
    @user = User.find_by(id: params[:user_id])
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_profile_path
    else
      render "new"
    end
  end


  private
  def profile_params
    params.require(:profile).permit(:user_id, :username, :avatar)
  end
end
