class Message < ActiveRecord::Base
  attr_accessible :receiver_id, :sender_id, :text, :parent_id
  
  validates_presence_of :receiver_id, :sender_id, :text
  
  belongs_to(
    :parent,
    class_name: "Message",
    foreign_key: :parent_id,
    primary_key: :id
  )
  
  has_many(
    :children,
    class_name: "Message",
    foreign_key: :parent_id,
    primary_key: :id
  )
  
  belongs_to(
    :sender,
    class_name: "User",
    foreign_key: :sender_id,
    primary_key: :id
  )

  belongs_to(
    :receiver,
    class_name: "User",
    foreign_key: :receiver_id,
    primary_key: :id
  )
  
  has_many :notifications, as: :notifiable, dependent: :destroy
end
