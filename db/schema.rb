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

ActiveRecord::Schema.define(version: 2021_07_13_043057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_rooms", force: :cascade do |t|
    t.string "title"
    t.bigint "sender_id", null: false
    t.bigint "recipient_id", null: false
    t.bigint "created_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_id"], name: "index_chat_rooms_on_created_id"
    t.index ["recipient_id"], name: "index_chat_rooms_on_recipient_id"
    t.index ["sender_id"], name: "index_chat_rooms_on_sender_id"
    t.index ["title"], name: "index_chat_rooms_on_title", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.string "body"
    t.bigint "user_id", null: false
    t.bigint "chat_room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "chat_rooms", "users", column: "created_id"
  add_foreign_key "chat_rooms", "users", column: "recipient_id"
  add_foreign_key "chat_rooms", "users", column: "sender_id"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
end
