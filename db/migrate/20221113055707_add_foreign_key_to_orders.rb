class AddForeignKeyToOrders < ActiveRecord::Migration[7.0]
  def change
		add_column :orders, :cart_id, :integer
		add_foreign_key :orders, :carts
  end
end
