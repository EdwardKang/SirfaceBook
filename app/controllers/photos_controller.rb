class PhotosController < ApplicationController
  before_filter :require_user!
  
  def show
    @photo = Photo.find(params[:id])
  end
end
