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

ActiveRecord::Schema.define(version: 2019_05_07_145514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drives", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.text "description"
    t.float "bound_a_lng"
    t.float "bound_a_lat"
    t.float "bound_b_lng"
    t.float "bound_b_lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "drive_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drive_id"], name: "index_favorites_on_drive_id"
    t.index ["user_id", "drive_id"], name: "index_favorites_on_user_id_and_drive_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "image_url"
    t.bigint "user_id"
    t.bigint "drive_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drive_id"], name: "index_photos_on_drive_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_url"
  end

  add_foreign_key "favorites", "drives"
  add_foreign_key "favorites", "users"
  add_foreign_key "photos", "drives"
  add_foreign_key "photos", "users"
end
