class Like < ActiveRecord::Base
  attr_accessible :comment_id, :post_id, :user_id
  validate :like_comment_or_post
  validates_presence_of :user_id
  validates :user_id, uniqueness: { scope: :comment_id }
  validates :user_id, uniqueness: { scope: :post_id }

  belongs_to(
    :comment,
    class_name: "Comment",
    foreign_key: :comment_id,
    primary_key: :id
  )

  belongs_to(
    :post,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id
  )

  def like_comment_or_post
    if self.comment_id.nil? && self.post_id.nil?
      errors.add(:comment_id, "post and comment id can't be nil")
    elsif self.comment_id && self.post_id
      errors.add(:post_id, "post and comment id can't both exist")
    end
  end
end
