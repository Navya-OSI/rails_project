class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all 
  end

  def new
    @profile = Profile.new
    @users = User.all
  end

  def create
    @profile = Profile.new(profile_params)
    @user = User.all
    if @profile.save
      # here we have pass the instance variable not the class variable
      ProfileJob.perform_now(@profile.created_at,@profile.updated_at)
      redirect_to profiles_index_path
    else
      flash[:alert] = "unable to create a profile"
      redirect_to profiles_index_path
    end
  end


  private

  def profile_params 
   params.require(:profile).permit(:user_id, :usertype)
  end
end
