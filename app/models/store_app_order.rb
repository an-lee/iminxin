# == Schema Information
#
# Table name: store_app_orders
#
#  id                                     :bigint(8)        not null, primary key
#  store_app_id                           :bigint(8)
#  buyer_id( 买家)                          :bigint(8)
#  currency_id(支付币种)                      :bigint(8)
#  total(订单总价)                            :decimal(, )
#  items_total(商品总价)                      :decimal(, )
#  shipment_total(运费总价)                   :decimal(, )
#  number(订单编号)                           :string
#  state(订单状态)                            :string
#  memo(备注)                               :string
#  payment_started_at(发起支付时间)             :datetime
#  payment_expired_at(支付超时时间)             :datetime
#  payment_completed_at(支付完成时间)           :datetime
#  processing_shipment_started_at(开始发货时间) :datetime
#  shipment_shipped_at(发货时间)              :datetime
#  cancelled_at(订单取消时间)                   :datetime
#  completed_at(订单完成时间)                   :datetime
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#
# Indexes
#
#  index_store_app_orders_on_buyer_id      (buyer_id)
#  index_store_app_orders_on_currency_id   (currency_id)
#  index_store_app_orders_on_store_app_id  (store_app_id)
#
# Foreign Keys
#
#  fk_rails_...  (buyer_id => mx_app_users.id)
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (store_app_id => mx_apps.id)
#

class StoreAppOrder < ApplicationRecord
  RECEIVED_SHIPMENT_EXPIRES_IN = 1.week

  include AASM
  include DisplayPrice
  include Numbering

  belongs_to :store_app
  belongs_to :buyer, class_name: 'StoreAppUser'

  has_many :store_app_order_items

  accepts_nested_attributes_for :store_app_order_items

  price_methods :total, :items_total, :shipment_total


  aasm column: :state do
    state :drafted, initial: true
    state :processing_payment
    state :payment_completed
    state :payment_expired
    state :processing_shipment
    state :shipment_shipped
    state :completed
    state :cancelled

    event :started_processing_payment, guards: [:ensure_payment_created?], after: :touch_processing_payment_started_at do
      transitions from: :drafted, to: :processing_payment
    end

    event :complete_payment, after: [:touch_payment_completed_at] do
      transitions from: :processing_payment, to: :payment_completed
    end

    event :expire_payment, guards: :ensure_payment_expired?, after: :touch_payment_expired_at do
      transitions from: :drafted, to: :payment_expired
      transitions from: :processing_payment, to: :payment_expired
    end

    event :started_processing_shipment, after: [:touch_processing_shipment_started_at] do
      transitions from: :payment_completed, to: :processing_shipment
    end

    event :ship_shipment, guards: :ensure_shipment_created?, after: :touch_shipment_shipped_at do
      transitions from: :processing_shipment, to: :shipment_shipped
    end

    event :expire_received_shipment, guards: :ensure_received_shipment_expired?, after: [:touch_completed_at] do
      transitions from: :shipment_shipped, to: :completed
    end

    event :cancel_shipment, after: :clear_shipment_shipped_at do
      transitions from: :shipment_shipped, to: :processing_shipment
    end

    event :received_shipment, after: [:touch_completed_at] do
      transitions from: :shipment_shipped, to: :completed
    end

    event :complete, after: [:touch_completed_at] do
      transitions from: :payment_completed, to: :completed
    end

    event :cancel, after: [:touch_cancelled_at, :reimburse_distribute_balance_on_cancel!] do
      transitions from: :processing_shipment, to: :cancelled
      transitions from: :shipment_shipped, to: :cancelled
      transitions from: :refunding, to: :cancelled
      transitions from: :refund_failed, to: :cancelled
    end
  end

  private

  def ensure_payment_created?
    return store_app_payments.present?
  end

  def ensure_payment_expired?
    Time.current > processing_payment_started_at + 1.hour
  end

  def ensure_shipment_created?
    store_app_shipment.present?
  end

  def ensure_received_shipment_expired?
    Time.current - shipment_shipped_at > RECEIVED_SHIPMENT_EXPIRES_IN
  end

  def touch_processing_payment_started_at
    touch(:processing_payment_started_at)
  end

  def touch_payment_completed_at
    touch(:payment_completed_at)
  end

  def touch_payment_expired_at
    touch(:payment_expired_at)
  end

  def touch_processing_shipment_started_at
    touch(:processing_shipment_started_at)
  end

  def touch_shipment_shipped_at
    touch(:shipment_shipped_at)
  end

  def touch_completed_at
    touch(:completed_at)
  end

  def touch_cancelled_at
    touch(:cancelled_at)
  end
end
