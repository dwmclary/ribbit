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

ActiveRecord::Schema.define(:version => 20120422064000) do

  create_table "artists", :force => true do |t|
    t.string   "name",               :null => false
    t.string   "gender"
    t.string   "birthplace"
    t.string   "born"
    t.string   "died"
    t.text     "biography"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists_hyperlinks", :id => false, :force => true do |t|
    t.integer "hyperlink_id"
    t.integer "artist_id"
  end

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
    t.integer  "piece_id"
  end

  create_table "exhibits", :force => true do |t|
    t.string   "name"
    t.date     "opening_date"
    t.date     "closing_date"
    t.string   "curator"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exhibits_pieces", :id => false, :force => true do |t|
    t.integer "exhibit_id"
    t.integer "piece_id"
  end

  create_table "galleries", :force => true do |t|
    t.integer  "piece_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gallery_images", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "piece_id"
  end

  create_table "hyperlinks", :force => true do |t|
    t.string   "link_text",  :null => false
    t.integer  "user_id",    :null => false
    t.integer  "piece_id"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hyperlinks_pieces", :id => false, :force => true do |t|
    t.integer "hyperlink_id"
    t.integer "piece_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "address"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "affiliation"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people_pieces", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "piece_id"
  end

  create_table "pieces", :force => true do |t|
    t.string   "accession",                                :null => false
    t.string   "title",                                    :null => false
    t.string   "dimensions"
    t.boolean  "outgoing_loan",         :default => false
    t.boolean  "incoming_loan",         :default => false
    t.string   "owner"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "classification"
    t.string   "medium"
    t.string   "framed_dimension"
    t.string   "packed_dimension"
    t.string   "condition_notes"
    t.string   "location"
    t.string   "hanging_hardware"
    t.string   "handling_instructions"
    t.string   "artist"
    t.string   "creation_date"
    t.string   "accession_date"
    t.string   "loan_date"
    t.string   "tags"
    t.string   "packed_with"
    t.string   "packed_in"
    t.integer  "artist_id"
    t.integer  "user_id",                                  :null => false
    t.string   "artist_name"
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
    t.string   "password"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
