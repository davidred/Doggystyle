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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141030014356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: true do |t|
    t.text     "body"
    t.integer  "from"
    t.integer  "to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preferences", force: true do |t|
    t.integer  "user_id",              null: false
    t.string   "preference_attribute", null: false
    t.integer  "value",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "omniauthid"
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gender",          null: false
    t.integer  "breed",           null: false
    t.string   "email",           null: false
    t.integer  "country",         null: false
    t.integer  "zip",             null: false
    t.text     "summary"
    t.string   "photo"
    t.integer  "age"
    t.integer  "size"
    t.integer  "play_style"
    t.integer  "energy_level"
    t.string   "owner_name"
    t.string   "owner_photo"
    t.integer  "owner_gender"
    t.integer  "owner_age"
  end

  add_index "users", ["breed"], name: "index_users_on_breed", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["gender"], name: "index_users_on_gender", using: :btree
  add_index "users", ["size"], name: "index_users_on_size", using: :btree

end
