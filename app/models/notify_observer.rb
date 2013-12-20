class NotifyObserver < ActiveRecord::Observer
  observe :post, :like, :comment, :message, :friendship

  def after_commit(record)
    notifiable_type = record.class.name
    if record.send(:transaction_include_action?, :create)
      if notifiable_type == "Post" || notifiable_type == "Message"
        Notification.create({ notifiable_id: record.id, notifiable_type: notifiable_type, user_id: record.receiver_id, sender_id: record.sender_id})
      elsif notifiable_type == "Friendship"
        Notification.create({ notifiable_id: record.id, notifiable_type: notifiable_type, user_id: record.friendee_id, sender_id: record.friender_id})
      elsif notifiable_type == "Comment"
        post = record.post
        Notification.create({ notifiable_id: record.id, notifiable_type: notifiable_type, user_id: post.receiver_id, sender_id: record.user_id })
        Notification.create({ notifiable_id: record.id, notifiable_type: notifiable_type, user_id: post.sender_id, sender_id: record.user_id })
      elsif notifiable_type == "Like"
        if record.likeable_type == "Comment"
          comment = record.likeable
          Notification.create({ notifiable_id: record.id, notifiable_type: notifiable_type, user_id: comment.user_id, sender_id: record.user_id })
        else
          post = record.likeable
          Notification.create({ notifiable_id: record.id, notifiable_type: notifiable_type, user_id: post.receiver_id, sender_id: record.user_id })
          Notification.create({ notifiable_id: record.id, notifiable_type: notifiable_type, user_id: post.sender_id, sender_id: record.user_id })
        end
      end

    elsif record.send(:transaction_include_action?, :update)
      Notification.create({ notifiable_id: record.id, notifiable_type: notifiable_type, user_id: record.friender_id, sender_id: record.friendee_id})
    end
  end
end
