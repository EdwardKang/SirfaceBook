class ProfilePicture < ActiveRecord::Base
  attr_accessible :photo_id, :user_id
  validates_uniqueness_of :user_id
  validates_presence_of :user_id, :photo_id
  
  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  
  belongs_to(
    :photo,
    class_name: "Photo",
    foreign_key: :photo_id,
    primary_key: :id
  )
end
