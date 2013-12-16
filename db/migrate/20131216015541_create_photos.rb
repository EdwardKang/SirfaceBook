class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id, null: false
      t.attachment :pic
      t.boolean :is_profile_pic
      t.integer :post_id
      t.timestamps
    end
  end
end
