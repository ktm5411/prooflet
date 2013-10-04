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

ActiveRecord::Schema.define(version: 20131004203237) do

  create_table "ads", force: true do |t|
    t.integer "advertiser_id"
    t.integer "ad_type",       limit: 2
    t.integer "price"
    t.string  "address"
    t.string  "city"
    t.string  "bull1"
    t.string  "bull2"
    t.string  "bull3"
    t.string  "bull4"
    t.string  "mls"
    t.string  "agent"
    t.string  "agent_phone"
    t.string  "agent_email"
    t.string  "sms_phone"
    t.string  "sms_code"
    t.date    "when_run"
    t.boolean "approved",                default: false
  end

  create_table "companies", force: true do |t|
    t.string "name"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "users", force: true do |t|
    t.string  "email",              default: "", null: false
    t.string  "encrypted_password", default: "", null: false
    t.integer "company_id"
    t.string  "type"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
