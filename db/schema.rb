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

ActiveRecord::Schema.define(version: 20160910033644) do

  create_table "charges", force: :cascade do |t|
    t.string   "item"
    t.integer  "price"
    t.integer  "user_id"
    t.integer  "vendor_id"
    t.string   "token"
    t.string   "customer_id"
    t.boolean  "completed",      default: false
    t.boolean  "boolean",        default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "stripe_user_id"
  end

  add_index "charges", ["user_id"], name: "index_charges_on_user_id"

  create_table "distances", force: :cascade do |t|
    t.integer  "value"
    t.integer  "spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "distances", ["spot_id"], name: "index_distances_on_spot_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "user_id"
    t.integer  "spot_id"
    t.boolean  "payed",      default: false
    t.boolean  "booked",     default: false
    t.integer  "charge_id"
  end

  add_index "events", ["charge_id"], name: "index_events_on_charge_id"
  add_index "events", ["spot_id"], name: "index_events_on_spot_id"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "lakes", force: :cascade do |t|
    t.string   "name"
    t.integer  "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "propulsions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spots", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "length"
    t.integer  "width"
    t.integer  "depth"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "price"
    t.integer  "park_id"
    t.integer  "term_id"
    t.boolean  "covered"
    t.integer  "ramp"
    t.integer  "user_id"
    t.boolean  "arrived"
    t.integer  "stripe_user_id"
    t.string   "spot_image_file_name"
    t.string   "spot_image_content_type"
    t.integer  "spot_image_file_size"
    t.datetime "spot_image_updated_at"
    t.string   "image_url"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "is_boat"
    t.integer  "type_id"
    t.integer  "occupants"
    t.integer  "propulsion_id"
    t.text     "make"
    t.integer  "lake_id"
    t.integer  "buyer_id"
  end

  add_index "spots", ["lake_id"], name: "index_spots_on_lake_id"
  add_index "spots", ["park_id"], name: "index_spots_on_park_id"
  add_index "spots", ["propulsion_id"], name: "index_spots_on_propulsion_id"
  add_index "spots", ["term_id"], name: "index_spots_on_term_id"
  add_index "spots", ["type_id"], name: "index_spots_on_type_id"
  add_index "spots", ["user_id"], name: "index_spots_on_user_id"

  create_table "terms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
    t.string   "publishable_key"
    t.string   "provider"
    t.string   "uid"
    t.string   "access_code"
    t.string   "stripe_user_id"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
