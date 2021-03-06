# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100222001536) do

  create_table "api_caches", :force => true do |t|
    t.string   "api_method"
    t.integer  "uid"
    t.text     "data"
    t.datetime "cached_until"
  end

  add_index "api_caches", ["api_method"], :name => "index_api_caches_on_api_method"
  add_index "api_caches", ["uid"], :name => "index_api_caches_on_uid"

  create_table "api_keys", :force => true do |t|
    t.integer  "uid"
    t.string   "key"
    t.datetime "last_updated_at"
    t.integer  "user_id"
    t.boolean  "working",         :default => false
    t.boolean  "full",            :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_keys", ["uid"], :name => "index_api_keys_on_uid"
  add_index "api_keys", ["user_id"], :name => "index_api_keys_on_user_id"

  create_table "applications", :force => true do |t|
    t.string   "name"
    t.string   "key"
    t.integer  "user_id"
    t.boolean  "disabled",   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applications", ["key"], :name => "index_applications_on_key", :unique => true
  add_index "applications", ["user_id"], :name => "index_applications_on_user_id"

  create_table "configuration_values", :force => true do |t|
    t.string "name"
    t.string "value"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email",                                             :null => false
    t.string   "encrypted_password",   :limit => 40,                :null => false
    t.string   "password_salt",                                     :null => false
    t.string   "confirmation_token",   :limit => 20
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token", :limit => 20
    t.string   "remember_token",       :limit => 20
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                    :default => 0
    t.string   "unlock_token",         :limit => 20
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
