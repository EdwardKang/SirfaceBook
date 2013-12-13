class Friendship < ActiveRecord::Base
  attr_accessible :friendee_id, :friender_id, :is_pending

  validates_presence_of :friendee_id, :friender_id
  validates :is_pending, inclusion: { in: [true, false] }

  belongs_to(
    :friender,
    class_name: "User",
    foreign_key: :friender_id,
    primary_key: :id
  )

  belongs_to(
    :friendee,
    class_name: "User",
    foreign_key: :friendee_id,
    primary_key: :id
  )
end
