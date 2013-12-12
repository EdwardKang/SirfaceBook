class Profile < ActiveRecord::Base
  attr_accessible :college, :current_city, :employer, :high_school, :hometown, :user_id, :interests
  validates_presence_of :high_school

  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )
end
