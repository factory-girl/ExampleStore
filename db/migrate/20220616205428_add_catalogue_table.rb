class AddCatalogueTable < ActiveRecord::Migration[6.1]
  def change
    create_table :catalogues do |t|
      t.string :sku
      t.string :name
      t.string :price

      t.timestamps
    end
  end
end
