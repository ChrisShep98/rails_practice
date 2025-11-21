# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2025_11_21_183436) do

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string "meal_type"
    t.integer "calories"
    t.integer "proteins"
    t.integer "carbohydrates"
    t.integer "fats"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_entries_on_category_id"
  end

  create_table "song_versions", force: :cascade do |t|
    t.string "song_name"
    t.string "date"
    t.string "venue_name"
    t.string "venue_location"
    t.integer "vote_count"
    t.integer "voted_by_id"
    t.integer "comments_id"
    t.integer "user_who_posted_id", null: false
    t.string "description"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comments_id"], name: "index_song_versions_on_comments_id"
    t.index ["user_who_posted_id"], name: "index_song_versions_on_user_who_posted_id"
    t.index ["voted_by_id"], name: "index_song_versions_on_voted_by_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.string "profile_picture"
    t.integer "posts_id", null: false
    t.integer "posts_commented_on_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["posts_commented_on_id"], name: "index_users_on_posts_commented_on_id"
    t.index ["posts_id"], name: "index_users_on_posts_id"
  end

  add_foreign_key "entries", "categories"
  add_foreign_key "song_versions", "comments", column: "comments_id"
  add_foreign_key "song_versions", "user_who_posteds"
  add_foreign_key "song_versions", "voted_bies"
  add_foreign_key "users", "posts", column: "posts_id"
  add_foreign_key "users", "posts_commented_ons"
end
