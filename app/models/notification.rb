class Notification < ActiveRecord::Base
  attr_accessible :user_id, :notifiable_type, :notifiable_id, :sender_id, :message
  validates_uniqueness_of :user_id, scope: [:notifiable_type, :notifiable_id]
  validates_presence_of :sender_id
  before_create :user_is_not_sender
  after_initialize :create_message


  belongs_to :notifiable, polymorphic: true

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :sender,
    class_name: "User",
    foreign_key: :sender_id,
    primary_key: :id
  )
  
  def create_message
    sender = self.sender
    receiver = self.user
		self.message = "<a href='/users/#{sender.id}/wall'>#{sender.first_name} #{sender.last_name}</a> "
    
    self.message += 
    case self.notifiable_type
    when 'Post'
      "has sent you a <a href='/users/#{self.user_id}/wall'>post</a>"
    when 'Message'
      "has sent you a <a href='/messages/#{self.notifiable_id}'>message</a>"
    when 'Friendship'
      if self.notifiable.is_pending == true
        "has sent you a <a href='/friend-requests'>friend request</a>"
      elsif self.notifiable.friendee_id != current_user_id
        "has confirmed you <b>friend request</b>"
      else
        "and you are now <b>friends</b>"
      end
    when 'Comment'
      "has commented on your <a href='/users/#{user_id}/wall'>post</a>"
    when 'Like'
      if self.notifiable.likeable_type == "Comment" 
        "likes your comment on " +
        if self.notifiable.likeable.post.receiver_id == self.user_id
          "<a href='/users/#{user_id}/wall'>your wall</a>"
        else
          "<a href='/users/#{self.notifiable.likeable.post.receiver_id}/wall'> #{self.notifiable.likeable.post.receiver.first_name}'s wall</a>"
        end
        
      else
        if self.notifiable.likeable.receiver_id == self.user_id
          "likes a post on <a href='/users/#{user_id}/wall'>your wall</a>"
        else
          "likes your post on <a href='/users/#{self.notifiable.likeable.receiver_id}/wall'> #{self.notifiable.likeable.receiver.first_name}'s wall</a>"
        end
      end
    end
      
    # if notifiable_type == "Post"
#       "has sent you a <a href='/users/#{current_user_id}/wall'>post</a>"
#       link_to "post", wall_user_url(current_user)
#     elsif notifiable_type == "Message"
#       has sent you a
#       link_to "message", message_url(notification.notifiable_id)
    # elsif notifiable_type == "Friendship"
    #   if notification.notifiable.is_pending == true
    #     has sent you a <%= link_to "friend request", "/friend-requests"
    #   elsif notification.notifiable.friendee_id != current_user.id
    #     has confirmed your <b>friend request</b>
    #   else
    #     and you are now <b>friends</b>
    #   end
    # elsif notifiable_type == "Comment"
    #   has commented on your
    #   link_to "post", wall_user_url(notification.notifiable.post.receiver_id)
    # elsif notifiable_type == "Like"
#       liked_obj = notification.notifiable.likeable
#       if liked_obj.class.name == "Comment"
#         if liked_obj.post.receiver.id == current_user.id
#           likes your comment on
#           link_to "your wall", wall_user_url(liked_obj.post.receiver)
#         else
#           likes your comment on
#           link_to "#{liked_obj.post.receiver.first_name}'s wall", wall_user_url(liked_obj.post.receiver)
#         end
#       elsif liked_obj.class.name == "Post"
#         if liked_obj.receiver_id == current_user.id
#           likes a post on
#           link_to "your wall", wall_user_url(liked_obj.receiver)
#         else
#           likes your post on
#           link_to "#{liked_obj.receiver.first_name}'s wall", wall_user_url(liked_obj.receiver)
#         end
#       end
#     end
  end
  
  def user_is_not_sender
    if self.sender_id == self.user_id
      return false
    end
  end
end
