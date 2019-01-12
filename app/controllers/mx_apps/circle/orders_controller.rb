class MxApps::Circle::OrdersController < MxApps::Circle::BaseController
  def index
    q = params[:q].to_s.strip
    q_ransack = { buyer_name_cont: q, buyer_phone_cont: q }

    orders = current_circle.orders.completed.ransack(q_ransack.merge(m: 'or')).result

    @orders = orders.order(created_at: :desc).page(params[:page])
    @orders_count = orders.count
  end
end
