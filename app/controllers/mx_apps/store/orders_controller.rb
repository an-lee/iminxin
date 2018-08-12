class MxApps::Store::OrdersController < MxApps::BaseController
  def index
    @orders = current_mx_app.orders.order(created_at: :desc).page(params[:page])
  end
end
