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

ActiveRecord::Schema.define(version: 20160601135418) do

  create_table "countries", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535, null: false
    t.datetime "image_updated_at"
    t.integer  "image_file_size",    limit: 4
    t.string   "image_content_type", limit: 255
    t.string   "image_file_name",    limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "begin_at"
    t.integer  "local_country_id",    limit: 4
    t.integer  "guess_country_id",    limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "pool_id",             limit: 4, null: false
    t.integer  "stade_id",            limit: 4, null: false
    t.integer  "local_country_score", limit: 4
    t.integer  "guess_country_score", limit: 4
  end

  add_index "matches", ["guess_country_id"], name: "index_matches_on_guess_country_id", using: :btree
  add_index "matches", ["local_country_id"], name: "index_matches_on_local_country_id", using: :btree
  add_index "matches", ["pool_id"], name: "index_matches_on_pool_id", using: :btree
  add_index "matches", ["stade_id"], name: "index_matches_on_stade_id", using: :btree

  create_table "pools", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "prizes", force: :cascade do |t|
    t.string   "name",               limit: 150
    t.text     "description",        limit: 65535
    t.integer  "quantity",           limit: 4
    t.string   "ref",                limit: 80
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "stades", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "address",    limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "last_name",              limit: 255
    t.string   "first_name",             limit: 255
    t.boolean  "is_admin",                           default: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "address",                limit: 255,                 null: false
    t.string   "city",                   limit: 255,                 null: false
    t.integer  "zip_code",               limit: 4,                   null: false
    t.string   "phone_number",           limit: 255,                 null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "matches", "countries", column: "guess_country_id"
  add_foreign_key "matches", "countries", column: "local_country_id"
end
