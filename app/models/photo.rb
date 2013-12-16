class Photo < ActiveRecord::Base
  attr_accessible :user_id, :pic, :is_profile_pic, :post_id

  validates :pic, :attachment_presence => true

  has_attached_file :pic, :styles => {
          :big => "600x600>",
          :medium => "50x50#",
          :smaller => "30x30#"
        }

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

end
