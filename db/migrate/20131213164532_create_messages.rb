class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :text
      t.integer :parent_id

      t.timestamps
    end
  end
end
