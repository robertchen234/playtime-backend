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

ActiveRecord::Schema.define(version: 2019_04_06_181509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "task"
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "friend_id"
    t.index ["player_id"], name: "index_activities_on_player_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "post_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.decimal "price", precision: 8, scale: 2
    t.datetime "date"
    t.string "location"
    t.string "description"
    t.string "banner_img"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_img"
    t.boolean "enable_posts"
    t.boolean "enable_seats"
  end

  create_table "posts", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id"
    t.integer "friend_id"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "position"
    t.integer "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "ticket_img"
    t.index ["event_id"], name: "index_seats_on_event_id"
  end

  create_table "streaks", force: :cascade do |t|
    t.integer "player_id"
    t.integer "friend_id"
    t.integer "count"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_streaks_on_activity_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "post_count"
    t.integer "post_max"
    t.integer "comment_count"
    t.integer "comment_max"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "city"
    t.string "school"
    t.string "work"
    t.integer "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lvl"
    t.integer "energy"
    t.integer "max_energy"
    t.integer "speed"
    t.string "profile_img"
    t.string "cover_img"
    t.integer "exp_limit"
  end

  add_foreign_key "activities", "users", column: "player_id"
  add_foreign_key "seats", "events"
  add_foreign_key "streaks", "activities"
  add_foreign_key "tasks", "users"
end
