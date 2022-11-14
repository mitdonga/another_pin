class RemoveCartIdInOrders < ActiveRecord::Migration[7.0]
  def change
		remove_column :orders, :cart_id
  end
end
