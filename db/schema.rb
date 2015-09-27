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

ActiveRecord::Schema.define(:version => 20141230070855) do

  create_table "categories", :force => true do |t|
    t.string "category_name", :null => false
  end

  create_table "members", :force => true do |t|
    t.text     "name",                               :null => false
    t.date     "birthday"
    t.integer  "sex",             :default => 0,     :null => false
    t.text     "tel"
    t.text     "adress"
    t.text     "mail"
    t.boolean  "magazine",        :default => false, :null => false
    t.string   "password"
    t.string   "user_name",                          :null => false
    t.boolean  "administrator",   :default => false, :null => false
    t.boolean  "clerk",           :default => false, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "hashed_password"
  end

  create_table "menus", :force => true do |t|
    t.string   "menu_name",   :null => false
    t.integer  "menu_time",   :null => false
    t.integer  "price",       :null => false
    t.integer  "category_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "opens", :force => true do |t|
    t.text     "time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reserves", :force => true do |t|
    t.integer  "menu_id",    :null => false
    t.integer  "staff_id",   :null => false
    t.date     "day",        :null => false
    t.integer  "open_id",    :null => false
    t.integer  "member_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shifts", :force => true do |t|
    t.integer  "staff_id",                   :null => false
    t.date     "day",                        :null => false
    t.integer  "going_time", :default => 1,  :null => false
    t.integer  "leave_time", :default => 21, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "shifts", ["day"], :name => "index_shifts_on_day"

  create_table "staffs", :force => true do |t|
    t.integer  "member_id",    :null => false
    t.integer  "category_id",  :null => false
    t.text     "intro_myself", :null => false
    t.text     "interest",     :null => false
    t.text     "staff_image",  :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
