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

ActiveRecord::Schema.define(version: 20160510144717) do

  create_table "blocks", force: :cascade do |t|
    t.integer  "blocker_id", limit: 4
    t.integer  "blocked_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "person_id",  limit: 4
    t.integer  "friend_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "desc",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "kinships", force: :cascade do |t|
    t.integer  "person_id",         limit: 4
    t.integer  "relative_id",       limit: 4
    t.string   "relationship_name", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "partnerships", force: :cascade do |t|
    t.integer  "person_id",        limit: 4
    t.integer  "partner_id",       limit: 4
    t.datetime "anniversary_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "message",     limit: 255
    t.integer  "author_id",   limit: 4
    t.integer  "receiver_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "user_interests", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "interest_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.datetime "date_of_birth"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "user_profile_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
