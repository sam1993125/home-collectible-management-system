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

ActiveRecord::Schema.define(version: 2022_07_09_232624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "item_statuses", force: :cascade do |t|
    t.integer "item_id"
    t.integer "user_id"
    t.boolean "selling_or_donating"
    t.datetime "report_date"
    t.boolean "is_shipped"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "user_id"
    t.string "image_url"
    t.string "object_name"
    t.integer "object_year"
    t.string "object_type"
    t.text "object_description"
    t.string "condition"
    t.string "location"
    t.string "bought_at"
    t.boolean "has_invoice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "user_type"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
