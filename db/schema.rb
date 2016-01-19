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

ActiveRecord::Schema.define(version: 20160119091807) do

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "adress1"
    t.string   "adress2"
    t.string   "adress3"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "responsibility"
    t.string   "costinfo1"
    t.string   "costinfo2"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "userid"
    t.string   "password"
    t.string   "lastname"
    t.string   "name"
    t.string   "adress1"
    t.string   "adress2"
    t.string   "adress3"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "org"
    t.binary   "image"
    t.decimal  "costrate"
    t.string   "costinfo1"
    t.string   "costinfo2"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
