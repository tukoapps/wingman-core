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

ActiveRecord::Schema.define(version: 20140812012842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bars", force: true do |t|
    t.string   "name"
    t.string   "yelp_id"
    t.string   "logo_url"
    t.string   "image_url"
    t.decimal  "lat",           precision: 10, scale: 6
    t.decimal  "lon",           precision: 10, scale: 6
    t.integer  "review_count"
    t.decimal  "rating",        precision: 4,  scale: 2
    t.integer  "current_users"
    t.decimal  "price",         precision: 4,  scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "neighborhood"
    t.string   "category"
  end

  add_index "bars", ["yelp_id"], name: "index_bars_on_yelp_id", using: :btree

  create_table "beta_emails", force: true do |t|
    t.string   "email",      default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "mobile_user_id"
    t.integer  "bar_id"
    t.integer  "elapsed_minutes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["bar_id"], name: "index_events_on_bar_id", using: :btree
  add_index "events", ["mobile_user_id"], name: "index_events_on_mobile_user_id", using: :btree

  create_table "mobile_users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "fb_access_token"
    t.integer  "fb_id",           limit: 8
    t.string   "email"
    t.boolean  "male"
    t.decimal  "lat",                       precision: 10, scale: 6
    t.decimal  "lon",                       precision: 10, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mobile_users", ["fb_access_token"], name: "index_mobile_users_on_fb_access_token", using: :btree
  add_index "mobile_users", ["fb_id"], name: "index_mobile_users_on_fb_id", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
