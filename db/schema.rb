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

ActiveRecord::Schema.define(:version => 20110524214553) do

  create_table "blog_rolls", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "icon_filename",        :limit => 120
    t.string   "description"
    t.float    "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blogroll_category_id"
  end

  create_table "blogroll_categories", :force => true do |t|
    t.string   "name",       :limit => 60, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title",      :limit => 140,                    :null => false
    t.string   "subtitle"
    t.text     "content",                                      :null => false
    t.integer  "posted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",                 :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",           :limit => 40,                      :null => false
    t.string   "email",              :limit => 120
    t.string   "access_level",       :limit => 20,  :default => "READ"
    t.string   "first_name",         :limit => 40
    t.string   "last_name",          :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
