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

ActiveRecord::Schema.define(version: 20171211155703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.float    "average_score"
  end

  create_table "cameras", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "brand_id"
    t.string   "image_url"
    t.string   "product_link"
    t.float    "average_score"
    t.string   "pixels"
    t.string   "sensor"
    t.string   "iso"
    t.string   "lens"
    t.string   "screen_size"
    t.string   "weight"
    t.string   "dimensions"
    t.index ["brand_id"], name: "index_cameras_on_brand_id", using: :btree
    t.index ["name"], name: "index_cameras_on_name", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "body"
    t.string   "sentiment"
    t.float    "score"
    t.integer  "camera_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camera_id"], name: "index_reviews_on_camera_id", using: :btree
  end

  add_foreign_key "cameras", "brands"
  add_foreign_key "reviews", "cameras"
end
