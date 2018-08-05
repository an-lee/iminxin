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

ActiveRecord::Schema.define(version: 2018_08_05_122320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "administrators", comment: "管理员", force: :cascade do |t|
    t.string "name", null: false, comment: "账号"
    t.string "password_digest", null: false, comment: "密码"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_administrators_on_name", unique: true
  end

  create_table "mx_apps", comment: "mixin 应用", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "type"
    t.string "number", comment: "编号"
    t.datetime "deleted_at", comment: "软删"
    t.string "client_id"
    t.string "client_secret"
    t.string "session_id"
    t.string "pin_token"
    t.text "private_key"
    t.json "raw", comment: "mixin 返回的 profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_mx_apps_on_number", unique: true
    t.index ["owner_id"], name: "index_mx_apps_on_owner_id"
  end

  create_table "user_authorizations", comment: "用户认证", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "provider", comment: "第三方来源"
    t.string "uid", comment: "第三方 user_id"
    t.json "raw", comment: "第三方返回的原始数据"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_user_authorizations_on_provider_and_uid", unique: true
    t.index ["user_id"], name: "index_user_authorizations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", comment: "用户名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "mx_apps", "users", column: "owner_id"
  add_foreign_key "user_authorizations", "users"
end
