class AddCartToOrderItems < ActiveRecord::Migration[7.0]
  def change
		add_column :order_items, :cart_id, :integer
  end
end
