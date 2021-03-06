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

ActiveRecord::Schema.define(version: 20170821194442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_clients_on_name", unique: true
  end

  create_table "loans", force: :cascade do |t|
    t.string "name"
    t.bigint "tariff_id"
    t.bigint "client_id"
    t.decimal "amount", precision: 14, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_loans_on_client_id"
    t.index ["name"], name: "index_loans_on_name", unique: true
    t.index ["tariff_id"], name: "index_loans_on_tariff_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "loan_id"
    t.decimal "base", precision: 14, scale: 2
    t.decimal "interest", precision: 14, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_id"], name: "index_payments_on_loan_id"
  end

  create_table "tariffs", force: :cascade do |t|
    t.string "name"
    t.integer "term", limit: 2
    t.decimal "interest", precision: 5, scale: 4
    t.decimal "overdue_interest", precision: 5, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tariffs_on_name", unique: true
  end

  add_foreign_key "loans", "clients"
  add_foreign_key "loans", "tariffs"
  add_foreign_key "payments", "loans"
end
