class AddOrderIdToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :order_id, :integer
  end
end
