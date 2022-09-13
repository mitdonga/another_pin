class AddColumnsToUsersTable < ActiveRecord::Migration[7.0]
  def change
		add_column :users, :user_name, :string, null: false
		add_column :users, :first_name, :string, null: false
		add_column :users, :last_name, :string
		add_column :users, :phone_number, :string
		add_column :users, :address, :text
		add_column :users, :is_admin, :boolean, default: false
  end
end
