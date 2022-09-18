class ChangeInColumnsInOrderItems < ActiveRecord::Migration[7.0]
  def up
		add_column :order_items, :order_id, :integer, null: true
  end
  def down
		remove_column :order_items, :order_id
		# remove_foreign_key :order_items, :orders
  end
end
