class Stores::OrdersController < Stores::BaseController
  before_action :load_order, only: [:edit, :update]

  def new
    @order = current_store.orders.new(params[:product_number])
  end

  def create
    service = StoreApps::CreateOrderService.new
    @order = service.call(current_store, current_store_user, order_params.to_h)
  end

  def edit
  end

  def update

  end

  private

  def order_params
    params.permit(items: [:product_id, :quantity])
  end

  def load_order
    @order = current_store.orders.find_by(number: params[:number])
  end
end
