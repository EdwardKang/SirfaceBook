class Like < ActiveRecord::Base
  attr_accessible :user_id, :likeable_type, :likeable_id
  validates_uniqueness_of :user_id, scope: [:likeable_id, :likeable_type] 
  
  
  belongs_to :likeable, polymorphic: true
  has_many :notifications, as: :notifiable, dependent: :destroy
end
