class ProfilesController < ApplicationController
  before_filter :require_user!

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(params[:profile])
    @profile.user_id = current_user.id
    @profile.save
    redirect_to root_url
  end

  def edit
    @profile = Profile.find_by_user_id(current_user.id)
  end

  def update
    @profile = Profile.find_by_user_id(current_user.id)
    @profile.update_attributes(params[:profile])
    redirect_to root_url
  end
end
