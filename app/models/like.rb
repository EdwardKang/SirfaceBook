class Like < ActiveRecord::Base
  attr_accessible :user_id, :likeable_type, :likeable_id
  
  belongs_to :likeable, polymorphic: true
  
  validates_uniqueness_of :user_id, scope: [:likeable_id, :likeable_type] 
end
