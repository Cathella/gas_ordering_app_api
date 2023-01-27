class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.string :location
      t.float :fees
      t.string :status
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
