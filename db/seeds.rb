require "json"

catalogue_json = File.read(File.join(Rails.root, '/app/assets/data/catalog.json'))
parsed_catalogue_json = JSON.parse(catalogue_json)
parsed_catalogue_json.each do | item |
  Catalogue.create(id: item["sku"], name: item["name"], price: item["price"])
end

order_json = File.read(File.join(Rails.root, '/app/assets/data/orders.json'))
parsed_order_json = JSON.parse(order_json)
parsed_order_json.each do | order |
  new_order = Order.create(customer: order["customer"])
  items = order["items"]

  items.each do | item |
    catalogue_item = Catalogue.find(item["sku"].to_i)
    Item.create(order_id: new_order.id, quantity: item["quantity"], sku: item["sku"], item_total: (catalogue_item.price.to_i*item["quantity"].to_i).to_s)
  end
end



