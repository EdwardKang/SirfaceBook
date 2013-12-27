class ProfilePicturesController < ApplicationController
  def create
    current_profile_pic = current_user.profile_picture
    if current_profile_pic
      current_profile_pic.destroy
    end
    
    ProfilePicture.create(photo_id: params[:photo_id], user_id: current_user.id)
    redirect_to :back
  end
end
