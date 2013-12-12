class Post < ActiveRecord::Base
  attr_accessible :body, :receiver_id, :sender_id

  validates_presence_of :body, :receiver_id, :sender_id

  has_many(
    :comments,
    class_name: "Comment",
    foreign_key: "post_id",
    primary_key: "id"
  )
end
