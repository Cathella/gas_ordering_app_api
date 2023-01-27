class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :quantity
      t.decimal :total_price
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      # t.belongs_to :payment, null: true, foreign_key: true

      t.timestamps
    end
  end
end
