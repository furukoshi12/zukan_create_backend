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

ActiveRecord::Schema[7.0].define(version: 2024_01_06_074736) do
  create_table "api_keys", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "access_token", null: false
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_token"], name: "index_api_keys_on_access_token", unique: true
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "field_designs", force: :cascade do |t|
    t.integer "label"
    t.integer "background_color"
    t.integer "color"
    t.integer "border_color"
    t.integer "border_style"
    t.integer "border_radius"
    t.integer "font_family"
    t.integer "font_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "illustrated_book_field_designs", force: :cascade do |t|
    t.text "content"
    t.integer "illustrated_book_id", null: false
    t.integer "field_design_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "height"
    t.float "width"
    t.float "x_position"
    t.float "y_position"
    t.index ["field_design_id"], name: "index_illustrated_book_field_designs_on_field_design_id"
    t.index ["illustrated_book_id"], name: "index_illustrated_book_field_designs_on_illustrated_book_id"
  end

  create_table "illustrated_book_tags", force: :cascade do |t|
    t.integer "illustrated_book_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["illustrated_book_id"], name: "index_illustrated_book_tags_on_illustrated_book_id"
    t.index ["tag_id"], name: "index_illustrated_book_tags_on_tag_id"
  end

  create_table "illustrated_books", force: :cascade do |t|
    t.string "title", null: false
    t.boolean "show_google_map", default: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "template_id", null: false
    t.string "image"
    t.float "image_x_position"
    t.float "image_y_position"
    t.index ["template_id"], name: "index_illustrated_books_on_template_id"
    t.index ["user_id"], name: "index_illustrated_books_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "illustrated_book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["illustrated_book_id"], name: "index_likes_on_illustrated_book_id"
    t.index ["user_id", "illustrated_book_id"], name: "index_likes_on_user_id_and_illustrated_book_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_field_designs", force: :cascade do |t|
    t.integer "template_id", null: false
    t.integer "field_design_id", null: false
    t.float "x_position"
    t.float "y_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "width"
    t.float "height"
    t.index ["field_design_id"], name: "index_template_field_designs_on_field_design_id"
    t.index ["template_id"], name: "index_template_field_designs_on_template_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "api_keys", "users"
  add_foreign_key "illustrated_book_field_designs", "field_designs"
  add_foreign_key "illustrated_book_field_designs", "illustrated_books"
  add_foreign_key "illustrated_book_tags", "illustrated_books"
  add_foreign_key "illustrated_book_tags", "tags"
  add_foreign_key "illustrated_books", "templates"
  add_foreign_key "illustrated_books", "users"
  add_foreign_key "likes", "illustrated_books"
  add_foreign_key "likes", "users"
  add_foreign_key "template_field_designs", "field_designs"
  add_foreign_key "template_field_designs", "templates"
end
