class CreateActors < ActiveRecord::Migration[7.0]
  def change
    create_table :actors do |t|
      t.string :email
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.integer :height
      t.string :eyes
      t.string :hair

      t.timestamps
    end
  end
end
