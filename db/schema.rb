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

ActiveRecord::Schema.define(version: 20150917170616) do

  create_table "apartments", force: true do |t|
    t.string   "apartment_number"
    t.string   "description"
    t.integer  "rent"
    t.datetime "date_available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packages", force: true do |t|
    t.datetime "arrived"
    t.datetime "picked_up"
    t.integer  "apartment_id"
    t.integer  "resident_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "residents", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone_personal"
    t.integer  "phone_work"
    t.integer  "apartment_id"
    t.string   "apartment_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "package_count"
  end

end
