class Comment < ActiveRecord::Base
  attr_accessible :body, :post_id
  validates_presence_of :body, :post_id

  belongs_to(
    :post,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id
  )

  has_many(
    :likes,
    class_name: "Like",
    foreign_key: :post_id,
    primary_key: :id
  )
end
