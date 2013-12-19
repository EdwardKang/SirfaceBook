class Post < ActiveRecord::Base
  attr_accessible :body, :receiver_id, :sender_id

  validates_presence_of :body, :receiver_id, :sender_id

  has_many(
    :comments,
    class_name: "Comment",
    foreign_key: :post_id,
    primary_key: :id,
    dependent: :destroy
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

  has_many(
    :photos,
    class_name: "Photo",
    foreign_key: :post_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many :likes, as: :likeable
  has_many :notifications, as: :notifiable, dependent: :destroy
end
