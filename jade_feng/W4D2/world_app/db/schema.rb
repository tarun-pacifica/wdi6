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

ActiveRecord::Schema.define(version: 20140930094117) do

  create_table "mountains", force: true do |t|
    t.string   "name"
    t.text     "image"
    t.integer  "elevation"
    t.text     "country"
    t.text     "continent"
    t.text     "parent_range"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oceans", force: true do |t|
    t.string   "name"
    t.text     "image"
    t.integer  "depth"
    t.integer  "area"
    t.integer  "volume"
    t.integer  "coastline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wonders", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "country"
    t.string   "continent"
    t.integer  "year_declared"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
