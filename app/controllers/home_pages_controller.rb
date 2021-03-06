class HomePagesController < ApplicationController
  before_filter :require_profile_and_user!

  def root
    @news = Post.includes(:photos, :receiver, sender: :profile_pic, :comments => [:user => [:profile_pic]]).order('created_at DESC').limit(10).select { |post| current_user.friends_ids.include?(post.receiver_id) || current_user.friends_ids.include?(post.sender_id) }

    render :root
  end

  def friend_req
  end

  def notifications
    @notifications = Notification.includes(:notifiable, :sender => [:profile_pic]).where(user_id: current_user.id)
  end
end
