class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,           null: false
      t.string :password_digest, null: false
      t.string :first_name,      null: false
      t.string :last_name,       null: false
      t.string :birth_month,     null: false
      t.integer :birth_day,      null: false
      t.integer :birth_year,     null: false
      t.string :gender,          null: false
      t.string :session_token,   null: false

      t.timestamps
    end

    add_index :users, :email,         unique: true
    add_index :users, :session_token, unique: true
  end
end
