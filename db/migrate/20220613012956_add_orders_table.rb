class AddOrdersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :customer
      t.string :items

      t.timestamps
    end
  end
end
