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

ActiveRecord::Schema.define(:version => 20131026184207) do

  create_table "likes", :force => true do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "likes", ["message_id"], :name => "index_likes_on_message_id"
  add_index "likes", ["user_id"], :name => "index_likes_on_user_id"

  create_table "messages", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "caption"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "ike_count"
    t.integer  "likes_count"
  end

  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "users", :force => true do |t|
    t.integer  "fb_user_id"
    t.string   "username"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
