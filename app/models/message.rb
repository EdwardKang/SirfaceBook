class Message < ActiveRecord::Base
  attr_accessible :recevier_id, :sender_id, :text
end
