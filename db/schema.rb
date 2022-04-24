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

ActiveRecord::Schema.define(version: 2022_04_24_172912) do

  create_table "attorneys", force: :cascade do |t|
    t.string "firm"
    t.decimal "bill_rate_hr"
    t.string "email"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cases", force: :cascade do |t|
    t.string "legal_server_case_id"
    t.integer "attorney_id", null: false
    t.integer "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attorney_id"], name: "index_cases_on_attorney_id"
    t.index ["client_id"], name: "index_cases_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "clientname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reports", force: :cascade do |t|
    t.decimal "hours_volunteered"
    t.date "fiscal_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "case_id", null: false
    t.index ["case_id"], name: "index_reports_on_case_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
  end

  add_foreign_key "cases", "attorneys"
  add_foreign_key "cases", "clients"
  add_foreign_key "reports", "cases"
end
