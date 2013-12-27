class CreateProfilePictures < ActiveRecord::Migration
  def change
    create_table :profile_pictures do |t|
      t.integer :photo_id
      t.integer :user_id
      t.timestamps
    end
    
    add_index :profile_pictures, :photo_id
    add_index :profile_pictures, :user_id
  end
end
