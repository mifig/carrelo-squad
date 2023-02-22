class AddLanguagesToActors < ActiveRecord::Migration[7.0]
  def change
    add_column :actors, :languages, :string
    add_column :actors, :languages_en, :string
  end
end
