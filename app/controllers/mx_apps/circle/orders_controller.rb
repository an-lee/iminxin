class MxApps::Circle::OrdersController < MxApps::Circle::BaseController
  def index
    @orders = current_circle.orders.order(created_at: :desc).page(params[:page])
  end
end
