class AddSkillsToActors < ActiveRecord::Migration[7.0]
  def change
    add_column :actors, :skills, :text
  end
end
