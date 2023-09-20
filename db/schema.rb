# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_20_145121) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.bigint "activity_type_id", null: false
    t.string "name"
    t.string "description"
    t.string "tutorial"
    t.string "benefits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_type_id"], name: "index_activities_on_activity_type_id"
  end

  create_table "activity_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "benefits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cardiovascular_deseases", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "risk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_parameterizations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "activity_id", null: false
    t.bigint "cardiovascular_desease_id", null: false
    t.integer "age"
    t.float "weight"
    t.integer "height"
    t.float "imc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_user_parameterizations_on_activity_id"
    t.index ["cardiovascular_desease_id"], name: "index_user_parameterizations_on_cardiovascular_desease_id"
    t.index ["user_id"], name: "index_user_parameterizations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.string "number_phone"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "activity_types"
  add_foreign_key "user_parameterizations", "activities"
  add_foreign_key "user_parameterizations", "cardiovascular_deseases"
  add_foreign_key "user_parameterizations", "users"
end
