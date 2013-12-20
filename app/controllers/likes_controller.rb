class LikesController < ApplicationController
  def create
    @like = Like.new(params[:like])
    @like.save

    if request.xhr?
      render partial: "layouts/like_button_post", locals: { post: @like.likeable }
    else
      redirect_to :back
    end
  end

  def destroy
    @like = Like.find(params[:id])
    likeable_obj = @like.likeable
    @like.destroy

    if request.xhr?
      render partial: "layouts/like_button_post", locals: { post: likeable_obj }
    else
      redirect_to :back
    end
  end
end
