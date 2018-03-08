class ProfilesController < ApplicationController

  def show
    @user = User.find_by(id: params[:user_id])
    @profile = @user.try(:profile)
    @interests = @user.try(:profile).try(:categories)
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @profile = Profile.new
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_profile_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @profile = @user.profile
  end

  def update
    binding.pry
    @user = User.find_by(id: params[:user_id])
    @profile = @user.profile
    @profile.update(profile_params)
    if @profile.save
      redirect_to user_profile_path
    else
      render "edit"
    end
  end


  private
  def profile_params
    params.require(:profile).permit(:user_id, :username, :avatar, :categories_attributes => [:id, :rating] )
  end
end
