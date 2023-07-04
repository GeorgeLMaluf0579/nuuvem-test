# frozen_string_literal: true

class OrdersService
  def list_orders
    orders = Order.all.order(id: :desc)

    orders.map do |order|
      OrderBlueprint.render_as_json(order)
    end
  end
end
