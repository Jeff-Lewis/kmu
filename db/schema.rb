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

ActiveRecord::Schema.define(version: 20160607052658) do

  create_table "appparams", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bid_details", force: :cascade do |t|
    t.integer  "bid_id"
    t.string   "status"
    t.string   "name"
    t.text     "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status"
    t.integer  "category_id"
    t.date     "date_from"
    t.date     "date_to"
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.boolean  "asap"
    t.string   "geo_address"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "calenders", force: :cascade do |t|
    t.string   "status"
    t.integer  "vehicle_id"
    t.boolean  "active"
    t.integer  "user_id"
    t.date     "date_from"
    t.integer  "time_from"
    t.date     "date_to"
    t.integer  "time_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "status"
    t.boolean  "active"
    t.boolean  "social"
    t.string   "name"
    t.integer  "category_id"
    t.string   "stichworte"
    t.string   "homepage"
    t.integer  "user_id"
    t.text     "description"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "geo_address"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "donation_details", force: :cascade do |t|
    t.string   "status"
    t.integer  "donation_id"
    t.string   "name"
    t.text     "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "donation_stats", force: :cascade do |t|
    t.string   "status"
    t.integer  "donation_id"
    t.integer  "user_id"
    t.integer  "company_id"
    t.float    "amount"
    t.boolean  "anonymous"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "donations", force: :cascade do |t|
    t.string   "status"
    t.string   "name"
    t.text     "description"
    t.integer  "company_id"
    t.float    "amount"
    t.boolean  "active"
    t.string   "stichworte"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ev_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_details", force: :cascade do |t|
    t.string   "status"
    t.integer  "event_id"
    t.string   "name"
    t.text     "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "status"
    t.boolean  "active"
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "ev_category_id"
    t.string   "name"
    t.text     "description"
    t.date     "date_from"
    t.date     "date_to"
    t.string   "homepage"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "geo_address"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "favourits", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "object_name"
    t.integer  "object_id"
    t.integer  "category"
    t.string   "stichworte"
    t.boolean  "email"
    t.boolean  "ticker"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "hotspot_details", force: :cascade do |t|
    t.integer  "hotspot_id"
    t.string   "status"
    t.string   "name"
    t.text     "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "hotspots", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status"
    t.boolean  "active"
    t.integer  "hs_category_id"
    t.string   "name"
    t.text     "description"
    t.string   "geo_address"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "stichworte"
    t.string   "homepage"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "hs_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hs_ratings", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.integer  "hotspot_id"
    t.string   "user_comment"
    t.integer  "user_rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "status"
    t.integer  "company_id"
    t.string   "name"
    t.boolean  "active"
    t.string   "stichworte"
    t.text     "tasks"
    t.text     "skills"
    t.text     "offers"
    t.text     "contacts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mob_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.integer  "service_id"
    t.string   "user_comment"
    t.integer  "user_rating"
    t.string   "anbieter_comment"
    t.integer  "anbieter_rating"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "request_details", force: :cascade do |t|
    t.string   "status"
    t.integer  "request_id"
    t.string   "name"
    t.text     "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "status"
    t.string   "rtype"
    t.float    "price"
    t.boolean  "active"
    t.string   "stichworte"
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "social"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string   "search_domain"
    t.string   "controller"
    t.string   "sql_string"
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.string   "status"
    t.string   "keywords"
    t.integer  "category_id"
    t.integer  "mob_category_id"
    t.integer  "hs_category_id"
    t.integer  "ev_category_id"
    t.integer  "age_from"
    t.integer  "age_to"
    t.date     "date_from"
    t.date     "date_to"
    t.integer  "distance"
    t.string   "geo_address"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "date_created_at"
    t.float    "rating"
    t.boolean  "social"
    t.integer  "amount_from_target"
    t.integer  "amount_to_target"
    t.integer  "amount_from"
    t.integer  "amount_to"
    t.float    "from_lat"
    t.float    "from_lgt"
    t.boolean  "special"
    t.string   "rtype"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "status"
    t.string   "stype"
    t.boolean  "active"
    t.string   "stichworte"
    t.decimal  "price_reg"
    t.decimal  "price_new"
    t.date     "datum_von"
    t.date     "datum_bis"
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "social"
    t.string   "ansprechpartner"
    t.string   "telefon"
    t.string   "email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "status"
    t.integer  "company_id"
    t.integer  "event_id"
    t.boolean  "active"
    t.string   "slevel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "status"
    t.string   "password"
    t.string   "lastname"
    t.string   "name"
    t.boolean  "active"
    t.boolean  "anonymous"
    t.boolean  "superuser"
    t.boolean  "webmaster"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.date     "dateofbirth"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "geo_address"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "org"
    t.binary   "image"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
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

  create_table "vehicles", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.string   "name"
    t.float    "price"
    t.integer  "time_from"
    t.integer  "time_to"
    t.boolean  "active"
    t.text     "description"
    t.integer  "mob_category_id"
    t.string   "stichworte"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "geo_address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "company_id"
  end

  create_table "webmasters", force: :cascade do |t|
    t.string   "object_name"
    t.integer  "object_id"
    t.integer  "user_id"
    t.integer  "web_user_id"
    t.text     "user_comment"
    t.text     "web_user_comment"
    t.string   "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
