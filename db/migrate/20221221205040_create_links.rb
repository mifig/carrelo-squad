class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :url
      t.references :social, null: true, foreign_key: true
      t.references :actor, null: false, foreign_key: true
      t.boolean :video, default: false

      t.timestamps
    end
  end
end
