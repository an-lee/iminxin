class Circles::MembershipOrdersController < Circles::BaseController
  def new
    @order = current_circle_user.orders.new(currency: current_circle.fee_currency)
  end

  def create
    render_turbolinks_reload && return if params[:trace_id].blank?
    render_turbolinks_reload && return if CircleAppPayment.exists?(trace_id: params[:trace_id])

    order = current_circle_user.orders.create!(currency: current_circle.fee_currency)
    payment = order.create_circle_circle_app_payment!(trace_id: params[:trace_id])
    order.started_processing_payment!

    @pay_url = current_circle.mixin_api.pay_url(
      recipient_id: payment.opponent_id,
      asset_id: payment.asset_id,
      amount: payment.amount,
      trace: payment.trace_id,
      memo: payment.memo
    )
  end
end
