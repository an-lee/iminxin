class Circles::PaymentStatesController < Circles::BaseController
  skip_before_action :authenticate_member!

  def show
    payment = current_circle.payments.find_by(trace_id: params[:trace_id])
    render plain: '' && return if payment.blank?

    r = current_circle.mixin_api.verify_payment({
        recipient_id: current_circle.client_id,
        asset_id: payment.asset_id,
        amount: payment.amount,
        trace: payment.trace_id
      })

    if r['data']&.fetch('status') == 'paid'
      payment.pay! if payment.state == 'pending'
      payment.circle_app_order.complete!
      render plain: 'paid'
    elsif r['data']&.fetch('status') == 'pending'
      render plain: 'pending'
    else
      render plain: ''
    end
  end
end