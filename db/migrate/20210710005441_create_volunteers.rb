class CreateVolunteers < ActiveRecord::Migration[6.1]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :email
      t.string :slackUserId
      t.string :pronouns
      t.string :primarySkills
      t.string :secondarySkills
      t.string :employer
      t.string :student
      t.string :assignedProjects
      t.string :jobTitle

      t.timestamps
    end
  end
end
