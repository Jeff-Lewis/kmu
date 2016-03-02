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

ActiveRecord::Schema.define(version: 20160229195408) do

  create_table "accesses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "workorder_id"
    t.float    "costrate"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "companies", force: :cascade do |t|
    t.boolean  "active"
    t.string   "name"
    t.integer  "user_id"
    t.text     "description"
    t.string   "adress1"
    t.string   "adress2"
    t.string   "adress3"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "plannings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "workorder_id"
    t.string   "event"
    t.integer  "year"
    t.integer  "month"
    t.integer  "week"
    t.integer  "day"
    t.integer  "percentage"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "rights", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.boolean  "superuser"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timetracks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "workorder_id"
    t.string   "tandm"
    t.boolean  "active"
    t.string   "activity"
    t.float    "amount"
    t.date     "datum"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "userid"
    t.string   "password"
    t.string   "lastname"
    t.string   "name"
    t.boolean  "active"
    t.boolean  "superuser"
    t.string   "adress1"
    t.string   "adress2"
    t.string   "adress3"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "org"
    t.binary   "image"
    t.float    "costrate"
    t.string   "costinfo1"
    t.string   "costinfo2"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "title"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

  create_table "workorders", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "parent_id"
    t.integer  "user_id"
    t.boolean  "active"
    t.string   "name"
    t.text     "description"
    t.string   "adress1"
    t.string   "adress2"
    t.string   "adress3"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "responsibility"
    t.string   "costinfo1"
    t.string   "costinfo2"
    t.date     "start_date"
    t.date     "end_date"
    t.float    "budget"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
