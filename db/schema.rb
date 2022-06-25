# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_07_025058) do

  create_table "college_majors", force: :cascade do |t|
    t.integer "college_id", null: false
    t.integer "major_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["college_id"], name: "index_college_majors_on_college_id"
    t.index ["major_id"], name: "index_college_majors_on_major_id"
  end

  create_table "colleges", force: :cascade do |t|
    t.string "coll_name"
    t.string "zip_code"
    t.string "cost_att"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.string "image"
    t.string "logo_image"
  end

  create_table "majors", force: :cascade do |t|
    t.string "subject"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string "coll_name"
    t.string "zip_code"
    t.string "cost_att"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "subject"
  end

  add_foreign_key "college_majors", "colleges"
  add_foreign_key "college_majors", "majors"
end
