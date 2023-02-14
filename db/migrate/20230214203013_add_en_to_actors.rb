class AddEnToActors < ActiveRecord::Migration[7.0]
  def change
    add_column :actors, :bio_en, :text
    add_column :actors, :eyes_en, :string
    add_column :actors, :hair_en, :string
  end
end
