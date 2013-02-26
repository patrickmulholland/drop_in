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

ActiveRecord::Schema.define(:version => 20130226112419) do

  create_table "comments", :force => true do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.string  "content"
    t.boolean "looked_at", :default => false
  end

  create_table "events", :force => true do |t|
    t.string   "user_id"
    t.text     "short_description", :limit => 255
    t.date     "date"
    t.time     "time"
    t.string   "street"
    t.text     "details"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "meeting_point"
    t.string   "city",                             :default => "Muenchen"
  end

  create_table "messages", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "topic"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "hometown"
    t.text     "about_you"
    t.date     "birthday"
    t.string   "gender"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "user_id"
    t.string   "hobbies"
    t.string   "profession"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "receive_mails",       :default => true
  end

  create_table "ratings", :force => true do |t|
    t.integer  "user_id"
    t.string   "result"
    t.string   "comment"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "event_id"
    t.boolean  "looked_at",  :default => false
  end

  create_table "replies", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.text     "message"
    t.boolean  "approved",             :default => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.boolean  "looked_at_reply",      :default => false
    t.boolean  "looked_at_invitation", :default => false
    t.boolean  "commit",               :default => false
    t.boolean  "looked_at_commit",     :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
