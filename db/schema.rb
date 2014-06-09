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

ActiveRecord::Schema.define(version: 20140511215159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "error_logs", force: true do |t|
    t.string   "message"
    t.string   "action"
    t.text     "backtrace"
    t.string   "extras"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helped_repos", force: true do |t|
    t.integer  "repo_id"
    t.integer  "user_id"
    t.boolean  "really_helping"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repos", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "github_url"
    t.boolean  "need_help"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "github_id"
    t.string   "full_name"
    t.text     "description"
    t.string   "language"
    t.integer  "forks"
    t.integer  "watchers"
    t.integer  "open_issues"
    t.datetime "pushed_at"
    t.text     "user_description"
    t.datetime "last_sync"
    t.boolean  "fork"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "github_id"
    t.string   "name"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
    t.string   "email"
    t.string   "avatar_url"
    t.string   "github_url"
    t.integer  "followers"
    t.integer  "following"
    t.integer  "public_repos"
    t.integer  "public_gists"
    t.datetime "last_sync"
    t.boolean  "admin",        default: false
  end

  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

end
