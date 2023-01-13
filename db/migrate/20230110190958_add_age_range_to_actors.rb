class AddAgeRangeToActors < ActiveRecord::Migration[7.0]
  def change
    add_column :actors, :min_age, :integer
    add_column :actors, :max_age, :integer
  end
end
