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

ActiveRecord::Schema.define(version: 20140625142226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beer_types", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "beers", force: true do |t|
    t.string   "name",            null: false
    t.integer  "brewery_id",      null: false
    t.text     "description",     null: false
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alcohol_content"
    t.integer  "beer_type_id",    null: false
  end

  add_index "beers", ["beer_type_id"], name: "index_beers_on_beer_type_id", using: :btree
  add_index "beers", ["brewery_id"], name: "index_beers_on_brewery_id", using: :btree

  create_table "breweries", force: true do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.integer  "region_id",   null: false
    t.string   "city",        null: false
    t.string   "state",       null: false
    t.string   "url"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "breweries", ["region_id"], name: "index_breweries_on_region_id", using: :btree

  create_table "regions", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "rating",      null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.integer  "user_id",     null: false
    t.integer  "beer_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["beer_id"], name: "index_reviews_on_beer_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "username",                               null: false
    t.boolean  "is_21",                                  null: false
    t.boolean  "is_admin",               default: false
    t.string   "image_url"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "vote",          null: false
    t.integer  "voteable_id",   null: false
    t.string   "voteable_type", null: false
    t.integer  "user_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree
  add_index "votes", ["voteable_id", "voteable_type"], name: "index_votes_on_voteable_id_and_voteable_type", using: :btree

end
