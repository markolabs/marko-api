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

ActiveRecord::Schema.define(:version => 20140108193306) do

  create_table "devices", :force => true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.time     "deleted_at"
  end

  add_index "devices", ["user_id"], :name => "index_devices_on_user_id"

  create_table "drops", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "message_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.time     "deleted_at"
  end

  add_index "drops", ["message_id"], :name => "index_drops_on_message_id"
  add_index "drops", ["receiver_id"], :name => "index_drops_on_receiver_id"
  add_index "drops", ["sender_id"], :name => "index_drops_on_sender_id"

  create_table "flags", :force => true do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.time     "deleted_at"
  end

  add_index "flags", ["message_id"], :name => "index_flags_on_message_id"
  add_index "flags", ["user_id", "message_id"], :name => "index_flags_on_user_id_and_message_id", :unique => true
  add_index "flags", ["user_id"], :name => "index_flags_on_user_id"

  create_table "impressions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.time     "deleted_at"
  end

  add_index "impressions", ["message_id"], :name => "index_impressions_on_message_id"
  add_index "impressions", ["user_id"], :name => "index_impressions_on_user_id"

  create_table "likes", :force => true do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.time     "deleted_at"
  end

  add_index "likes", ["message_id"], :name => "index_likes_on_message_id"
  add_index "likes", ["user_id", "message_id"], :name => "index_likes_on_user_id_and_message_id", :unique => true
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
    t.integer  "likes_count"
    t.boolean  "image_processing"
    t.integer  "flags_count"
    t.time     "deleted_at"
  end

  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "notifications", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.boolean  "read"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "verb"
    t.time     "deleted_at"
  end

  add_index "notifications", ["receiver_id"], :name => "index_notifications_on_receiver_id"
  add_index "notifications", ["sender_id"], :name => "index_notifications_on_sender_id"
  add_index "notifications", ["target_id"], :name => "index_notifications_on_target_id"
  add_index "notifications", ["target_type"], :name => "index_notifications_on_target_type"

  create_table "opro_auth_grants", :force => true do |t|
    t.string   "code"
    t.string   "access_token"
    t.string   "refresh_token"
    t.text     "permissions"
    t.datetime "access_token_expires_at"
    t.integer  "user_id"
    t.integer  "application_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "opro_auth_grants", ["access_token"], :name => "index_opro_auth_grants_on_access_token", :unique => true
  add_index "opro_auth_grants", ["code"], :name => "index_opro_auth_grants_on_code", :unique => true
  add_index "opro_auth_grants", ["refresh_token"], :name => "index_opro_auth_grants_on_refresh_token", :unique => true

  create_table "opro_client_apps", :force => true do |t|
    t.string   "name"
    t.string   "app_id"
    t.string   "app_secret"
    t.text     "permissions"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "opro_client_apps", ["app_id", "app_secret"], :name => "index_opro_client_apps_on_app_id_and_app_secret", :unique => true
  add_index "opro_client_apps", ["app_id"], :name => "index_opro_client_apps_on_app_id", :unique => true

  create_table "pings", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.time     "deleted_at"
    t.boolean  "background"
    t.integer  "device_id"
  end

  add_index "pings", ["background"], :name => "index_pings_on_background"
  add_index "pings", ["device_id"], :name => "index_pings_on_device_id"
  add_index "pings", ["user_id"], :name => "index_pings_on_user_id"

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.time     "deleted_at"
    t.boolean  "active"
    t.boolean  "fb_friend"
  end

  add_index "relationships", ["active"], :name => "index_relationships_on_active"
  add_index "relationships", ["fb_friend"], :name => "index_relationships_on_fb_friend"
  add_index "relationships", ["friend_id"], :name => "index_relationships_on_friend_id"
  add_index "relationships", ["user_id", "friend_id"], :name => "index_relationships_on_user_id_and_friend_id", :unique => true
  add_index "relationships", ["user_id"], :name => "index_relationships_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "token"
    t.integer  "user_id"
    t.integer  "device_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.time     "deleted_at"
  end

  add_index "sessions", ["device_id"], :name => "index_sessions_on_device_id"
  add_index "sessions", ["token"], :name => "index_sessions_on_token", :unique => true
  add_index "sessions", ["user_id"], :name => "index_sessions_on_user_id"

  create_table "users", :force => true do |t|
    t.integer  "fb_user_id",          :limit => 8
    t.string   "username"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "fb_token"
    t.boolean  "fb_token_expired"
    t.time     "deleted_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

end
