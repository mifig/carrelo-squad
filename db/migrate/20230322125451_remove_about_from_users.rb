class RemoveAboutFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :about, :text
    remove_column :users, :about_en, :text
  end
end
