class PostsController < ApplicationController
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to :back
    end
  end
end
