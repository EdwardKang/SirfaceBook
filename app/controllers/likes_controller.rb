class LikesController < ApplicationController
  def create
    @like = Like.new(params[:like])
    @like.save
    redirect_to :back
  end

  def destroy
  end
end
