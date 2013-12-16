class Photo < ActiveRecord::Base
  attr_accessible :user_id, :pic, :is_profile_pic, :post_id
  
  validates :pic, :attachment_presence => true
  
  has_attached_file :pic, :styles => {
          :big => "600x600>",
          :small => "50x50#"
        }
end
