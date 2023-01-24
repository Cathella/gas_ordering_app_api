class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.string :location
      t.string :phone
      t.string :status
      t.references :products, null: false, foreign_key: true

      t.timestamps
    end
  end
end
