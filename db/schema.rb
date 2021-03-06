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

ActiveRecord::Schema[7.0].define(version: 2022_05_28_091907) do
  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.integer "energy", null: false
    t.float "carbohydrate", null: false
    t.float "salt", null: false
    t.float "protein", null: false
    t.float "lipids", null: false
    t.float "sugar", null: false
    t.float "fibers", null: false
    t.float "saturated_fatty_acids", null: false
    t.boolean "archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ingredients_on_name", unique: true
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.text "ingredients"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "budget"
    t.string "prep_time"
    t.string "cook_time"
    t.string "total_time"
    t.boolean "archived", default: false
  end

end
