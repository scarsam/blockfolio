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

ActiveRecord::Schema.define(version: 20180110225005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coin_portfolios", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "percentage_change_24h", precision: 5, scale: 2
    t.integer "coin_id"
    t.integer "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coins", force: :cascade do |t|
    t.string "name"
    t.decimal "price_usd", precision: 6, scale: 3
    t.decimal "market_cap_usd", precision: 11, scale: 1
    t.decimal "percentage_change_24h", precision: 5, scale: 2
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "name"
    t.decimal "total_value", precision: 10, scale: 2
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
