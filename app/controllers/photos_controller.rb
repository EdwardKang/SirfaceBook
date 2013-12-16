class PhotosController < ApplicationController
  def show
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    current_profile_pic = Photo.where(user_id: current_user.id, is_profile_pic: true)[0]
    if current_profile_pic
      current_profile_pic.is_profile_pic = false
    end

    @photo.update_attributes(is_profile_pic: true)
    redirect_to :back
  end
end
