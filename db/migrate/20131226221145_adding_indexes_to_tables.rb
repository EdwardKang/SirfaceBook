class AddingIndexesToTables < ActiveRecord::Migration
  def change
    add_index :profiles, :user_id
    add_index :posts, :receiver_id
    add_index :posts, :sender_id
    add_index :photos, :post_id
    add_index :photos, :user_id
    add_index :notifications, :user_id
    add_index :notifications, :sender_id
    add_index :notifications, [:notifiable_id, :notifiable_type]
    add_index :messages, :sender_id
    add_index :messages, :receiver_id
    add_index :messages, :parent_id
    add_index :likes, [:likeable_id, :likeable_type]
    add_index :likes, :user_id
    add_index :friendships, :friender_id
    add_index :friendships, :friendee_id
    add_index :comments, :post_id
    add_index :comments, :user_id
  end
end
