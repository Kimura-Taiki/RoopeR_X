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

ActiveRecord::Schema.define(version: 2022_02_07_064402) do

  create_table "boards", force: :cascade do |t|
    t.integer "week"
    t.integer "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crimes", force: :cascade do |t|
    t.string "name"
    t.integer "shift"
    t.integer "counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incidents", force: :cascade do |t|
    t.integer "day"
    t.integer "script_id"
    t.integer "pawn_id"
    t.integer "crime_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_crime_owns", force: :cascade do |t|
    t.integer "package_id"
    t.integer "crime_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_position_owns", force: :cascade do |t|
    t.integer "package_id"
    t.integer "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_rule_owns", force: :cascade do |t|
    t.integer "package_id"
    t.integer "rule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paruos", force: :cascade do |t|
    t.integer "package_id"
    t.integer "rule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pawns", force: :cascade do |t|
    t.integer "script_id"
    t.integer "za_id"
    t.integer "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.integer "max"
    t.integer "refusal"
    t.integer "unkillable"
    t.integer "obstinate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rule_position_owns", force: :cascade do |t|
    t.integer "rule_id"
    t.integer "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.string "name"
    t.integer "xy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "script_rule_contracts", force: :cascade do |t|
    t.integer "script_id"
    t.integer "rule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scripts", force: :cascade do |t|
    t.string "name"
    t.integer "package_id"
    t.integer "noof_days"
    t.integer "noof_weeks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "za_category_attributions", force: :cascade do |t|
    t.integer "za_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["za_id", "category_id"], name: "index_za_category_attributions_on_za_id_and_category_id", unique: true
  end

  create_table "zas", force: :cascade do |t|
    t.string "name"
    t.integer "paranoia_limit"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
