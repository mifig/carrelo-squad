class AddOrderIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :order_id, :integer
  end
end
