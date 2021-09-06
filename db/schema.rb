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

ActiveRecord::Schema.define(version: 2021_07_26_001500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "volunteer_projects", force: :cascade do |t|
    t.integer "volunteer_id", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "volunteer_skills", force: :cascade do |t|
    t.integer "volunteer_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "slackUserId"
    t.string "pronouns"
    t.string "employer"
    t.string "student"
    t.string "jobTitle"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "onboarding_attended_at", precision: 6
    t.datetime "one_on_one_attended_at", precision: 6
  end

  add_foreign_key "volunteer_projects", "projects", column: "id", name: "volunteer_projects_to_projects"
  add_foreign_key "volunteer_projects", "volunteers", column: "id", name: "volunteer_projects_to_volunteers"
  add_foreign_key "volunteer_skills", "skills", column: "id", name: "volunteer_skills_to_skills"
  add_foreign_key "volunteer_skills", "volunteers", column: "id", name: "volunteer_skills_to_volunteers"
end
