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

ActiveRecord::Schema.define(version: 2021_05_19_104151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arms", force: :cascade do |t|
    t.string "name"
    t.integer "limit", default: 0
    t.bigint "clinic_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clinic_id"], name: "index_arms_on_clinic_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clinics_doctors", force: :cascade do |t|
    t.bigint "clinic_id"
    t.bigint "doctor_id"
    t.index ["clinic_id"], name: "index_clinics_doctors_on_clinic_id"
    t.index ["doctor_id"], name: "index_clinics_doctors_on_doctor_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "contact_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "contact_no"
    t.string "gender"
    t.integer "age"
    t.bigint "arm_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["arm_id"], name: "index_patients_on_arm_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.string "uuid"
    t.string "study_uuid"
    t.string "location"
    t.string "phone"
    t.string "email"
    t.string "timezone"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "state"
    t.string "city"
    t.string "country"
    t.bigint "study_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["study_id"], name: "index_sites_on_study_id"
  end

  create_table "studies", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.string "drug"
    t.string "sponsor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "arms", "clinics"
end
