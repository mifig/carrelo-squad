class AddOrderedPhotosToActors < ActiveRecord::Migration[7.0]
  def change
    add_column :actors, :ordered_photo_ids, :json, default: []
  end
end
