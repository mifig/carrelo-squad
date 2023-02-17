class AddSkillsEnToActors < ActiveRecord::Migration[7.0]
  def change
    add_column :actors, :skills_en, :text
  end
end
