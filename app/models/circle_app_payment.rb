# == Schema Information
#
# Table name: circle_app_payments
#
#  id                    :bigint(8)        not null, primary key
#  circle_app_order_id   :bigint(8)
#  payer_id(支付者)         :bigint(8)
#  currency_id           :bigint(8)
#  asset_id              :string
#  opponent_id           :string
#  trace_id              :string
#  amount                :decimal(, )
#  memo                  :string
#  state                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_circle_app_payments_on_circle_app_order_id  (circle_app_order_id)
#  index_circle_app_payments_on_currency_id          (currency_id)
#  index_circle_app_payments_on_payer_id             (payer_id)
#
# Foreign Keys
#
#  fk_rails_...  (circle_app_order_id => circle_app_orders.id)
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (payer_id => mx_app_users.id)
#

class CircleAppPayment < ApplicationRecord
  include AASM
  include DisplayPrice

  belongs_to :circle_app_order
  belongs_to :currency
  belongs_to :payer, class_name: 'CircleAppUser'

  before_validation :setup_attributes

  aasm column: :state do
    state :pending, initial: true
    state :paid

    event :pay do
      transitions from: :pending, to: :paid
    end
  end

  private

  def setup_attributes
    self.payer = circle_app_order.buyer
    self.currency = circle_app_order.currency
    self.asset_id = currency.asset_id
    self.opponent_id = circle_app_order.circle_app.client_id
    self.amount = circle_app_order.total
    self.memo = format('welcome', circle_app_order.circle_app.name)
  end
end
