class Notification < ActiveRecord::Base
  attr_accessible :user_id, :notifiable_type, :notifiable_id, :sender_id
  validates_uniqueness_of :user_id, scope: [:notifiable_type, :notifiable_id]
  validates_presence_of :sender_id
  before_create :user_is_not_sender


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

  def user_is_not_sender
    if self.sender_id == self.user_id
      return false
    end
  end
end
