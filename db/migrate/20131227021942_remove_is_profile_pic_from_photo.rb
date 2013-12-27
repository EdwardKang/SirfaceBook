class RemoveIsProfilePicFromPhoto < ActiveRecord::Migration
  def change
    remove_column :photos, :is_profile_pic 
  end
end
