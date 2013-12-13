class CommentsController < ApplicationController
  before_filter :require_user!

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to :back
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
end
