class AddForeignKeyToCart < ActiveRecord::Migration[7.0]
  def change
		add_column :carts, :order_id, :integer
		add_foreign_key :carts, :orders
  end
end
