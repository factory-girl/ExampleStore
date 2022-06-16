require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "A valid Appointment can be created" do
    order = Order.create(customer: "Test Customer", items: "[{ 'sku': 1002, 'quantity': 2 }]")
    assert order.valid?
  end
end
