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

ActiveRecord::Schema.define(version: 2022_01_17_120729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "cat_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "com_description"
    t.string "com_image"
    t.bigint "idea_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["idea_id"], name: "index_comments_on_idea_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "depts", force: :cascade do |t|
    t.string "dep_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "idea_files", force: :cascade do |t|
    t.string "idea_file"
    t.bigint "idea_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["idea_id"], name: "index_idea_files_on_idea_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.string "idea_name"
    t.string "idea_description"
    t.bigint "category_id", null: false
    t.bigint "mission_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_ideas_on_category_id"
    t.index ["mission_id"], name: "index_ideas_on_mission_id"
    t.index ["user_id"], name: "index_ideas_on_user_id"
  end

  create_table "mission_deptos", force: :cascade do |t|
    t.bigint "mission_id", null: false
    t.bigint "dept_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dept_id"], name: "index_mission_deptos_on_dept_id"
    t.index ["mission_id"], name: "index_mission_deptos_on_mission_id"
  end

  create_table "missions", force: :cascade do |t|
    t.string "mis_name"
    t.string "mis_description"
    t.string "mis_image"
    t.bigint "dept_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "dat_limite"
    t.integer "ies_ativo"
    t.integer "ies_multi"
    t.index ["dept_id"], name: "index_missions_on_dept_id"
    t.index ["user_id"], name: "index_missions_on_user_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.string "file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "user_name"
    t.string "email"
    t.string "password_digest"
    t.string "user_phone"
    t.bigint "dept_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ies_ativo"
    t.index ["dept_id"], name: "index_users_on_dept_id"
  end

  add_foreign_key "comments", "ideas"
  add_foreign_key "comments", "users"
  add_foreign_key "idea_files", "ideas"
  add_foreign_key "ideas", "categories"
  add_foreign_key "ideas", "missions"
  add_foreign_key "ideas", "users"
  add_foreign_key "mission_deptos", "depts"
  add_foreign_key "mission_deptos", "missions"
  add_foreign_key "missions", "depts"
  add_foreign_key "missions", "users"
  add_foreign_key "users", "depts"
end
