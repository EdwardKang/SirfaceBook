class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :sender_id
      t.references :notifiable, polymorphic: true

      t.timestamps
    end
  end
end
