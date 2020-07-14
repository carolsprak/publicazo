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

ActiveRecord::Schema.define(version: 20170924005301) do

  create_table "photos", force: :cascade do |t|
    t.integer  "service_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["service_id"], name: "index_photos_on_service_id"

  create_table "reservation_services", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "service_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "price"
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "time_start"
    t.datetime "time_end"
  end

  add_index "reservation_services", ["service_id"], name: "index_reservation_services_on_service_id"
  add_index "reservation_services", ["user_id"], name: "index_reservation_services_on_user_id"

  create_table "review_services", force: :cascade do |t|
    t.text     "comment"
    t.integer  "star",                   default: 1
    t.integer  "service_id"
    t.integer  "reservation_service_id"
    t.integer  "guest_id"
    t.integer  "host_id"
    t.string   "type"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "review_services", ["guest_id"], name: "index_review_services_on_guest_id"
  add_index "review_services", ["host_id"], name: "index_review_services_on_host_id"
  add_index "review_services", ["reservation_service_id"], name: "index_review_services_on_reservation_service_id"
  add_index "review_services", ["service_id"], name: "index_review_services_on_service_id"

  create_table "services", force: :cascade do |t|
    t.string   "service_category"
    t.string   "service_type"
    t.string   "payment_period"
    t.string   "listing_name"
    t.text     "summary"
    t.string   "address"
    t.boolean  "is_independent"
    t.boolean  "is_legal_person"
    t.boolean  "has_invoice"
    t.boolean  "has_garantee"
    t.float    "price"
    t.boolean  "active"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "service_mode"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "services", ["user_id"], name: "index_services_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fullname"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "phone_number"
    t.text     "description"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
