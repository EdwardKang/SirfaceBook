class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :high_school
      t.string :college
      t.string :employer
      t.string :current_city
      t.string :hometown
      t.string :interests
      t.integer :user_id

      t.timestamps
    end
  end
end
