class Init < ActiveRecord::Migration
  def change
    create_table "comments", force: :cascade do |t|
      t.references "post", index: true, null: false
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
      t.string   "body",       limit: 255, null: false
    end

    create_table "likes", force: :cascade do |t|
      t.references "post", index: true, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "posts", force: :cascade do |t|
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
      t.string   "body",       limit: 255, null: false
    end

    create_table "subscriptions", force: :cascade do |t|
      t.references "follower", index: true, null: false
      t.references "followed", index: true, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "users", force: :cascade do |t|
      t.string   "user_name",  limit: 255, null: false
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
    end
  end
end
