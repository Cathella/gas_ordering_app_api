class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :status
      t.integer :customer_id

      t.timestamps
    end
  end
end
