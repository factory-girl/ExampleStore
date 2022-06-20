require 'json'

class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @order_items = []
    @order_item_names = []
      @orders.each do | order |
        @order_items.push(order.items)
      end

      @order_items.each do | items |
        items.each do | item |
          @order_item_names.push(Catalogue.find(item["sku"].to_i).name)
        end
      end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = Item.where(:order_id => @order.id)
    @order_item_names = []
    @order_items.each do | item |
      @order_item_names.push(Catalogue.find(item["sku"].to_i).name)
    end
  end
end
