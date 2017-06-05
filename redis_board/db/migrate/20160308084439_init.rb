class Init < ActiveRecord::Migration
  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topic_id",   null: false
    t.integer  "user_id",    null: false
    t.string   "title",      null: false
    t.string   "body",       null: false
  end

  create_table "subscriptions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",     null: false
    t.integer  "category_id", null: false
  end

  create_table "topics", force: true do |t|
    t.string   "name",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id", null: false
    t.integer  "user_id",     null: false
  end

  create_table "users", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
