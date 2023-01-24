class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, default: 1, null: false
      t.string :status, default: 'pending', null: false

      t.timestamps
    end

    add_index :orders, :customer_id
    add_index :orders, :product_id
    add_index :orders, [:customer_id, :product_id], unique: true
  end
end
