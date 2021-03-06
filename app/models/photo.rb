class Photo < ActiveRecord::Base
  attr_accessible :user_id, :pic, :is_profile_pic, :post_id

  validates :pic, :attachment_presence => true
  validates_presence_of :user_id

  has_attached_file :pic, :styles => {}

  belongs_to(
    :post,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id
  )

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  
  has_many(
    :profile_pics,
    class_name: "ProfilePicture",
    foreign_key: :photo_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many :likes, as: :likeable
end
