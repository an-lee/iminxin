class MxApps::Circle::OrdersController < MxApps::Circle::BaseController
  def index
    orders = current_circle.orders.completed
    @orders = orders.order(created_at: :desc).page(params[:page])
    @orders_count = orders.count
  end
end
