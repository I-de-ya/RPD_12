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

ActiveRecord::Schema.define(:version => 20120225160419) do

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug_en"
    t.string   "slug_ru"
  end

  add_index "posts", ["slug_en"], :name => "index_posts_on_slug_en"
  add_index "posts", ["slug_ru"], :name => "index_posts_on_slug_ru"

  create_table "speeches", :force => true do |t|
    t.string   "organization"
    t.string   "author_name"
    t.string   "title"
    t.string   "phone"
    t.string   "email"
    t.boolean  "delivery_subscription"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "theme_id"
    t.boolean  "is_plenar",             :default => false
    t.string   "thesis"
  end

  create_table "themes", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "email"
    t.boolean  "admin",              :default => false
  end

end
