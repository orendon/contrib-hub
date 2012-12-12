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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121212121047) do

  create_table "helped_repos", :force => true do |t|
    t.integer  "repo_id"
    t.integer  "user_id"
    t.boolean  "really_helping"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "repos", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "github_url"
    t.boolean  "need_help"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
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
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "github_id"
    t.string   "name"
    t.string   "token"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
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
  end

  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

end
