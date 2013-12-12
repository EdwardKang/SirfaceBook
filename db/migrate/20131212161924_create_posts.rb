class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :body

      t.timestamps
    end
  end
end
