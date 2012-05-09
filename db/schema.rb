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

ActiveRecord::Schema.define(:version => 20120509194953) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.string   "uid"
    t.boolean  "active",     :default => true
    t.boolean  "collecting", :default => true
    t.integer  "elo",        :default => 1500
    t.float    "wr"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "brands", ["uid"], :name => "index_brands_on_uid", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name",            :limit => 100
    t.string   "email",           :limit => 70,  :default => "", :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "auth_level",                     :default => 1
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.date     "dateofbirth"
    t.integer  "gender"
    t.string   "zipcode"
    t.integer  "country_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
