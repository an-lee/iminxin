# == Schema Information
#
# Table name: circle_app_orders
#
#  id                         :bigint(8)        not null, primary key
#  circle_app_id              :bigint(8)
#  buyer_id( 买家)            :bigint(8)
#  currency_id(支付币种)      :bigint(8)
#  total(订单总价)            :decimal(, )
#  number(订单编号)           :string
#  state(订单状态)            :string
#  completed_at(订单完成时间) :datetime
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_circle_app_orders_on_buyer_id       (buyer_id)
#  index_circle_app_orders_on_circle_app_id  (circle_app_id)
#  index_circle_app_orders_on_currency_id    (currency_id)
#
# Foreign Keys
#
#  fk_rails_...  (buyer_id => mx_app_users.id)
#  fk_rails_...  (circle_app_id => mx_apps.id)
#  fk_rails_...  (currency_id => currencies.id)
#

class CircleAppOrder < ApplicationRecord
  extend Enumerize
  include AASM
  include DisplayPrice
  include OrderNumbering

  belongs_to :currency
  belongs_to :circle_app
  belongs_to :buyer, class_name: 'CircleAppUser'

  has_one :circle_app_payment

  enumerize :order_type, in: %w(membership), default: 'membership'

  aasm column: :state do
    state :drafted, initial: true
    state :processing_payment
    state :completed

    event :started_processing_payment, guards: :ensure_payment_created? do
      transitions from: :drafted, to: :processing_payment
    end

    event :complete, guards: :ensure_payment_paid?, after: [:touch_completed_at, :callback_after_order_completed] do
      transitions from: :processing_payment, to: :completed
    end
  end

  private

  def ensure_payment_created?
    circle_app_payment.present?
  end

  def ensure_payment_paid?
    circle_app_payment&.paid?
  end

  def touch_completed_at
    touch(:completed_at)
  end

  def callback_after_order_completed
    case order_type
    when 'membership'
      buyer.membership.update_1_year_membership!
    end
  end
end
