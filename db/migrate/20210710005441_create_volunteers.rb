class CreateVolunteers < ActiveRecord::Migration[6.1]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :email
      t.string :slack_user_id
      t.string :pronouns
      t.string :primary_skills
      t.string :secondary_skills
      t.string :employer
      t.string :student
      t.string :assigned_projects
      t.string :job_title

      t.timestamps
    end
  end
end
