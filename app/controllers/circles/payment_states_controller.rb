class Circles::PaymentStatesController < Circles::BaseController
  def show
    payment = current_circle_app.payments.find_by(trace_id: params[:trace_id])
    render plain: '' && return if payment.blank?

    r = current_circle_app.mixin_api.verify_payment({
        recipient_id: current_circle_app.client_id,
        asset_id: payment.asset_id,
        amount: payment.amount,
        trace: payment.trace_id
      })

    if r['data'].fetch('status') == 'paid'
      payment.pay! if payment.state == 'pending'
      payment.order.complete!
      render plain: 'paid'
    elsif r['data'].fetch('status') == 'pending'
      render plain: 'pending'
    else
      render plain: ''
    end
  end
end