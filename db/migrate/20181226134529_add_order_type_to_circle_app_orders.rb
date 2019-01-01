class AddOrderTypeToCircleAppOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :circle_app_orders, :order_type, :string, comment: '订单类型'
  end
end
