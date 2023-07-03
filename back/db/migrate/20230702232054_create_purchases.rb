class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.references :order
      t.references :item
      t.references :merchant
      t.references :purchaser
      t.integer :quantity

      t.timestamps
    end
  end
end
