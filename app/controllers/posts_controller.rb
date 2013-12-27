class PostsController < ApplicationController
  before_filter :require_user!

  def create
    @post = Post.new(params[:post])
    @post.sender_id = current_user.id

    if params[:photo]
      params[:photo][:user_id] = current_user.id
      @post.photos.new(params[:photo])
    end

    @post.save

    if request.xhr?
      render partial: "layouts/post_view", locals: { post: @post }
    else
      redirect_to :back
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    if request.xhr?
      render partial: "layouts/empty"
    else
      redirect_to :back
    end
  end
end
