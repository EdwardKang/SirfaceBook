class PostsController < ApplicationController
  before_filter :require_user!

  def create
    @post = Post.new(params[:post])
    @post.sender_id = current_user.id
    @post.save
    redirect_to :back
  end
end
