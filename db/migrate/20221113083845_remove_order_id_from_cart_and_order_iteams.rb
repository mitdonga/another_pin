class RemoveOrderIdFromCartAndOrderIteams < ActiveRecord::Migration[7.0]
  def change
		remove_column :carts, :order_id
		remove_column :order_items, :order_id
  end
end
