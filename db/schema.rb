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

ActiveRecord::Schema.define(version: 20150515045338) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id",  limit: 4
    t.string  "address",  limit: 255
    t.string  "country",  limit: 255
    t.string  "state",    limit: 255
    t.decimal "zip_code",             precision: 10
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id",      limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "avg",           limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "overall_avg",   limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pendings", force: :cascade do |t|
    t.integer "quest_id", limit: 4
    t.integer "user_id",  limit: 4
  end

  add_index "pendings", ["quest_id"], name: "fk_rails_bf4f56646d", using: :btree
  add_index "pendings", ["user_id"], name: "fk_rails_348b8ce411", using: :btree

  create_table "phone_numbers", force: :cascade do |t|
    t.integer "user_id",      limit: 4
    t.decimal "phone_number",           precision: 10
  end

  add_index "phone_numbers", ["user_id"], name: "index_phone_numbers_on_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id",                limit: 4
    t.string  "first_name",             limit: 255
    t.string  "last_name",              limit: 255
    t.string  "gender",                 limit: 255
    t.decimal "questgiver_rating",                  precision: 10
    t.decimal "adventurer_rating",                  precision: 10, scale: 2, default: 0.0
    t.string  "address",                limit: 255
    t.float   "latitude",               limit: 24
    t.float   "longitude",              limit: 24
    t.integer "num_adventurer_ratings", limit: 4,                            default: 0
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "quests", force: :cascade do |t|
    t.integer  "questgiver_id",   limit: 4
    t.integer  "adventurer_id",   limit: 4
    t.string   "title",           limit: 255
    t.decimal  "price",                       precision: 10, scale: 2
    t.string   "description",     limit: 255
    t.datetime "post_time"
    t.datetime "expiration_time"
    t.integer  "status",          limit: 4,                            default: 0
  end

  add_index "quests", ["adventurer_id"], name: "fk_rails_ebc9300d3c", using: :btree
  add_index "quests", ["questgiver_id"], name: "fk_rails_371c072cbc", using: :btree

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id",      limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "stars",         limit: 24,  null: false
    t.string   "dimension",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id",   limit: 4
    t.string   "cacheable_type", limit: 255
    t.float    "avg",            limit: 24,  null: false
    t.integer  "qty",            limit: 4,   null: false
    t.string   "dimension",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "quest_id",      limit: 4
    t.integer  "questgiver_id", limit: 4
    t.integer  "adventurer_id", limit: 4
    t.integer  "rating",        limit: 4
    t.string   "comment",       limit: 255
    t.datetime "post_time"
  end

  add_index "reviews", ["adventurer_id"], name: "fk_rails_a8f70b96e1", using: :btree
  add_index "reviews", ["quest_id"], name: "fk_rails_d5cb7a2472", using: :btree
  add_index "reviews", ["questgiver_id"], name: "fk_rails_128c278297", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "pendings", "quests"
  add_foreign_key "pendings", "users"
  add_foreign_key "phone_numbers", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "quests", "users", column: "adventurer_id"
  add_foreign_key "quests", "users", column: "questgiver_id"
  add_foreign_key "reviews", "quests"
  add_foreign_key "reviews", "users", column: "adventurer_id"
  add_foreign_key "reviews", "users", column: "questgiver_id"
end
