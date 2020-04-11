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

ActiveRecord::Schema.define(version: 2020_04_11_143653) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "category_id"
    t.integer "brand_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "category_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "colume_images", force: :cascade do |t|
    t.integer "column_id"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "column_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "fermer_id"
    t.integer "consumer_id"
    t.integer "column_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "column_favorites", force: :cascade do |t|
    t.integer "fermer_id"
    t.integer "consumer_id"
    t.integer "column_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "columns", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "fermer_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consumers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "kana_first_name"
    t.string "kana_last_name"
    t.string "phone"
    t.integer "gender"
    t.integer "age"
    t.boolean "withdraw", default: false, null: false
    t.integer "postcode"
    t.integer "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
    t.integer "profile_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_consumers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_consumers_on_reset_password_token", unique: true
  end

  create_table "fermers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "garden"
    t.integer "profile_image_id"
    t.string "first_name"
    t.string "last_name"
    t.string "kana_first_name"
    t.string "kana_last_name"
    t.string "phone"
    t.boolean "withdraw", default: false, null: false
    t.integer "postcode"
    t.integer "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
    t.string "home_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_fermers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_fermers_on_reset_password_token", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "brand_id"
    t.integer "category_id"
    t.integer "quantity"
    t.integer "stock_id"
    t.integer "fermer_id"
    t.integer "sale_status"
    t.integer "unit_price"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
