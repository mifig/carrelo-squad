class AddBioAndAboutToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :bio_en, :text
    add_column :users, :about, :text
    add_column :users, :about_en, :text
  end
end
