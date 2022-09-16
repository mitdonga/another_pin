class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :country
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :postal_code

      t.timestamps
    end
  end
end
