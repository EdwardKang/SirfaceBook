class Post < ActiveRecord::Base
  attr_accessible :body, :receiver_id, :sender_id
end
