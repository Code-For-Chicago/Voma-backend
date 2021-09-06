class CreateProjectsAndSkills < ActiveRecord::Migration[6.1]
  def up
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

    add_foreign_key :volunteer_projects, :volunteers, column: "id", name: "volunteer_projects_to_volunteers"
    add_foreign_key :volunteer_projects, :projects, column: "id", name: "volunteer_projects_to_projects"
    add_foreign_key :volunteer_skills, :volunteers, column: "id", name: "volunteer_skills_to_volunteers"
    add_foreign_key :volunteer_skills, :skills, column: "id", name: "volunteer_skills_to_skills"

    remove_column :volunteers, :primarySkills
    remove_column :volunteers, :secondarySkills
    remove_column :volunteers, :assignedProjects

    add_column :volunteers, :onboarding_attended_at, :datetime, precision: 6, null:true
    add_column :volunteers, :one_on_one_attended_at, :datetime, precision: 6, null:true
  end

  def down
    remove_foreign_key :volunteer_projects, name: "volunteer_projects_to_volunteers"
    remove_foreign_key :volunteer_projects, name: "volunteer_projects_to_projects"
    remove_foreign_key :volunteer_skills, name: "volunteer_skills_to_volunteers"
    remove_foreign_key :volunteer_skills, name: "volunteer_skills_to_skills"

    drop_table "projects"
    drop_table "skills"
    drop_table "volunteer_projects"
    drop_table "volunteer_skills"

    add_column :volunteers, :primarySkills, :string
    add_column :volunteers, :secondarySkills, :string
    add_column :volunteers, :assignedProjects, :string

    remove_column :volunteers, :onboarding_attended_at
    remove_column :volunteers, :one_on_one_attended_at
  end
end

