class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :inventory
      t.integer :quantity
      t.string :gas_provider
      t.float :cylinder_weight
      t.float :price
      t.string :order_type

      t.timestamps
    end
  end
end
