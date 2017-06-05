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

ActiveRecord::Schema.define(version: 20160510101212) do

  create_table "hardwares", force: :cascade do |t|
    t.string   "warranty",   limit: 255
    t.string   "purpose",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "director",         limit: 255
    t.string   "genre",            limit: 255
    t.string   "age_requirements", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "music_cds", force: :cascade do |t|
    t.string   "artist",     limit: 255
    t.string   "genre",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "quantity",          limit: 4
    t.integer  "price",             limit: 4
    t.integer  "product_info_id",   limit: 4
    t.string   "product_info_type", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "products", ["product_info_type", "product_info_id"], name: "index_products_on_product_info_type_and_product_info_id", using: :btree

  create_table "products_sales", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "sale_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "products_sales", ["product_id"], name: "index_products_sales_on_product_id", using: :btree
  add_index "products_sales", ["sale_id"], name: "index_products_sales_on_sale_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.integer  "price",      limit: 4
    t.integer  "staff_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "sales", ["staff_id"], name: "index_sales_on_staff_id", using: :btree

  create_table "staffs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "position",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.boolean  "completed"
    t.integer  "sale_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "video_games", force: :cascade do |t|
    t.string   "genre",            limit: 255
    t.string   "age_requirements", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
