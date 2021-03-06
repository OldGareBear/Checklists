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

ActiveRecord::Schema.define(version: 20160912125345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checklists", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "author_id"
  end

  create_table "items", force: :cascade do |t|
    t.text     "text"
    t.boolean  "is_done"
    t.integer  "checklist_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "items", ["checklist_id"], name: "index_items_on_checklist_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "session_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users_checklists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "checklist_id"
  end

  add_index "users_checklists", ["checklist_id"], name: "index_users_checklists_on_checklist_id", using: :btree
  add_index "users_checklists", ["user_id"], name: "index_users_checklists_on_user_id", using: :btree

  add_foreign_key "checklists", "users", column: "author_id"
  add_foreign_key "items", "checklists"
  add_foreign_key "users_checklists", "checklists"
  add_foreign_key "users_checklists", "users"
end
