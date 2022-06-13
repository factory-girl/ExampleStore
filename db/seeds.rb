require "json"

order_json = File.read(File.join(Rails.root, '/app/assets/data/orders.json'))
parsed_order_json = JSON.parse(order_json)
parsed_order_json.each do | order |
  Order.create(customer: order["customer"], items: order["items"])
end



