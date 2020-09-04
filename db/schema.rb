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

ActiveRecord::Schema.define(version: 2020_09_04_133355) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company_name_deliver", default: ""
    t.integer "postal_code", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "block", null: false
    t.string "building"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.bigint "job_id"
    t.index ["job_id"], name: "index_images_on_job_id"
  end

  create_table "jobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "occupation", default: ""
    t.date "Posting_end_date", null: false
    t.string "employment_id", default: "", null: false
    t.text "job_description", null: false
    t.text "qualification", null: false
    t.text "salary", null: false
    t.text "treatment", null: false
    t.text "working_hours", null: false
    t.text "holiday", null: false
    t.string "work_location", null: false
    t.text "application_method", null: false
    t.string "contact", null: false
    t.string "location", null: false
    t.integer "phone", null: false
    t.string "hp_address"
    t.text "start_id", null: false
    t.text "stop_id"
    t.text "end_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "Posting_start_date", null: false
    t.string "contact_name"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "user_img"
    t.string "company_name", null: false
    t.string "company_name_kana", null: false
    t.string "business_content", null: false
    t.string "staff_name", null: false
    t.string "staff_name_kana", null: false
    t.string "URL"
    t.integer "faxphone"
    t.integer "phone", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "images", "jobs"
  add_foreign_key "jobs", "users"
end
