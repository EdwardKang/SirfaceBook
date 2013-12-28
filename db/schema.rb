# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131228025128) do

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.string   "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "friendships", :force => true do |t|
    t.integer  "friender_id"
    t.integer  "friendee_id"
    t.boolean  "is_pending"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "friendships", ["friendee_id"], :name => "index_friendships_on_friendee_id"
  add_index "friendships", ["friender_id"], :name => "index_friendships_on_friender_id"

  create_table "likes", :force => true do |t|
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "likes", ["likeable_id", "likeable_type"], :name => "index_likes_on_likeable_id_and_likeable_type"
  add_index "likes", ["user_id"], :name => "index_likes_on_user_id"

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "text"
    t.integer  "parent_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "messages", ["parent_id"], :name => "index_messages_on_parent_id"
  add_index "messages", ["receiver_id"], :name => "index_messages_on_receiver_id"
  add_index "messages", ["sender_id"], :name => "index_messages_on_sender_id"

  create_table "notifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sender_id"
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "message"
  end

  add_index "notifications", ["notifiable_id", "notifiable_type"], :name => "index_notifications_on_notifiable_id_and_notifiable_type"
  add_index "notifications", ["sender_id"], :name => "index_notifications_on_sender_id"
  add_index "notifications", ["user_id"], :name => "index_notifications_on_user_id"

  create_table "photos", :force => true do |t|
    t.integer  "user_id",          :null => false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.integer  "post_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "photos", ["post_id"], :name => "index_photos_on_post_id"
  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "posts", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "body"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "posts", ["receiver_id"], :name => "index_posts_on_receiver_id"
  add_index "posts", ["sender_id"], :name => "index_posts_on_sender_id"

  create_table "profile_pictures", :force => true do |t|
    t.integer  "photo_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "profile_pictures", ["photo_id"], :name => "index_profile_pictures_on_photo_id"
  add_index "profile_pictures", ["user_id"], :name => "index_profile_pictures_on_user_id"

  create_table "profiles", :force => true do |t|
    t.string   "high_school"
    t.string   "college"
    t.string   "employer"
    t.string   "current_city"
    t.string   "hometown"
    t.string   "interests"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.string   "first_name",      :null => false
    t.string   "last_name",       :null => false
    t.string   "birth_month",     :null => false
    t.integer  "birth_day",       :null => false
    t.integer  "birth_year",      :null => false
    t.string   "gender",          :null => false
    t.string   "session_token",   :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true

end
