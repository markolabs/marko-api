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

ActiveRecord::Schema.define(:version => 20131125084243) do

  create_table "flags", :force => true do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "flags", ["message_id"], :name => "index_flags_on_message_id"
  add_index "flags", ["user_id", "message_id"], :name => "index_flags_on_user_id_and_message_id", :unique => true
  add_index "flags", ["user_id"], :name => "index_flags_on_user_id"

  create_table "impressions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "impressions", ["message_id"], :name => "index_impressions_on_message_id"
  add_index "impressions", ["user_id"], :name => "index_impressions_on_user_id"

  create_table "likes", :force => true do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "likes", ["message_id"], :name => "index_likes_on_message_id"
  add_index "likes", ["user_id", "message_id"], :name => "index_likes_on_user_id_and_message_id", :unique => true
  add_index "likes", ["user_id"], :name => "index_likes_on_user_id"

  create_table "messages", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "type"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "caption"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "likes_count"
    t.boolean  "image_processing"
    t.integer  "flags_count"
  end

  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "pings", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pings", ["user_id"], :name => "index_pings_on_user_id"

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "relationships", ["friend_id"], :name => "index_relationships_on_friend_id"
  add_index "relationships", ["user_id", "friend_id"], :name => "index_relationships_on_user_id_and_friend_id", :unique => true
  add_index "relationships", ["user_id"], :name => "index_relationships_on_user_id"

  create_table "users", :force => true do |t|
    t.integer  "fb_user_id",       :limit => 8
    t.string   "username"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "fb_token"
    t.boolean  "fb_token_expired"
  end

end
