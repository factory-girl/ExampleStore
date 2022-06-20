require 'json'

class OrdersController < ApplicationController
  def index
    @orders = Order.all
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
