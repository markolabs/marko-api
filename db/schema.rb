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

ActiveRecord::Schema.define(:version => 20131120223445) do

  create_table "color_themes", :force => true do |t|
    t.string   "name"
    t.string   "background"
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
    t.integer  "color_theme_id"
    t.boolean  "image_processing"
  end

  add_index "messages", ["color_theme_id"], :name => "index_messages_on_color_theme_id"
  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

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
    t.integer  "fb_user_id", :limit => 8
    t.string   "username"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "provider"
  end

end
