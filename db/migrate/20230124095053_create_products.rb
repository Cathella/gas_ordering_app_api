class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.integer :inventory

      t.timestamps
    end
  end
end
