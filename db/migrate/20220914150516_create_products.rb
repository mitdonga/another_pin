class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.string :image_1, null: false
      t.string :image_2
      t.string :image_3
      t.string :image_4
      t.string :image_5
      t.float :price, null: false
      t.boolean :is_featured, default: false
      t.string :collection_date
      t.text :description, null: false
      t.boolean :is_sold_out, default: false

      t.timestamps
    end
  end
end
