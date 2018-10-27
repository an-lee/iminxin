# == Schema Information
#
# Table name: store_app_payments
#
#  id                                  :bigint(8)        not null, primary key
#  store_app_order_id                  :bigint(8)
#  payer_id(支付者)                       :bigint(8)
#  currency_id(支付币种)                   :bigint(8)
#  total(对应 mixin 支付中的 amount)         :decimal(, )
#  state(支付状态)                         :string
#  number(支付编号，对应 mixin 支付中的 trace_id) :string
#  memo(备注)                            :string
#  completed_at(支付完成时间)                :datetime
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
# Indexes
#
#  index_store_app_payments_on_currency_id         (currency_id)
#  index_store_app_payments_on_payer_id            (payer_id)
#  index_store_app_payments_on_store_app_order_id  (store_app_order_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (payer_id => mx_app_users.id)
#  fk_rails_...  (store_app_order_id => store_app_orders.id)
#

FactoryBot.define do
  factory :store_app_payment do
    
  end
end
