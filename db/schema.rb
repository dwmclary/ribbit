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

ActiveRecord::Schema.define(:version => 20111127074623) do

  create_table "events", :force => true do |t|
    t.string   "event_type",         :null => false
    t.string   "event_tags"
    t.string   "event_owner",        :null => false
    t.string   "created_by",         :null => false
    t.datetime "event_time",         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "pieces", :force => true do |t|
    t.string   "accession",                             :null => false
    t.string   "title",                                 :null => false
    t.string   "dimensions"
    t.string   "artist",                                :null => false
    t.date     "created_at"
    t.boolean  "outgoing_loan",      :default => false
    t.boolean  "incoming_loan",      :default => false
    t.string   "owner"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                :null => false
    t.string   "name",                                                 :null => false
    t.string   "role",                                                 :null => false
    t.boolean  "is_admin",                          :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
