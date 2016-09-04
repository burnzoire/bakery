# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160904064522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_packs", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "quantity"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "item_packs", ["item_id"], name: "index_item_packs_on_item_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_item_histories", force: :cascade do |t|
    t.integer  "order_item_id"
    t.integer  "quantity"
    t.float    "price_per_pack"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "item_pack_id"
  end

  add_index "order_item_histories", ["item_pack_id"], name: "index_order_item_histories_on_item_pack_id", using: :btree
  add_index "order_item_histories", ["order_item_id"], name: "index_order_item_histories_on_order_item_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  add_foreign_key "item_packs", "items"
  add_foreign_key "order_item_histories", "item_packs"
  add_foreign_key "order_item_histories", "order_items"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "customers"
end
