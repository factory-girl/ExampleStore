class AddItemsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :order
      t.string :sku
      t.string :quantity
      t.string :item_total

      t.timestamps
    end
  end
end
