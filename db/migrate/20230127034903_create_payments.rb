class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :method
      t.string :status
      t.decimal :total_amount
      t.references :order, null: false, foreign_key: true
      t.references :delivery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
