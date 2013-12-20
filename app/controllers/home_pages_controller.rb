class HomePagesController < ApplicationController
  before_filter :require_user!

  def root
    @news = Post.order('created_at DESC').limit(10).all.select { |post| current_user.friends_ids.include?(post.receiver_id) || current_user.friends_ids.include?(post.sender_id) }

    render :root
  end

  def friend_req
  end

  def notifications
    @notifications = Notification.where(user_id: current_user.id)
  end
end
