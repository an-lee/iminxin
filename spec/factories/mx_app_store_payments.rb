# == Schema Information
#
# Table name: mx_app_store_payments
#
#  id                         :bigint(8)        not null, primary key
#  mx_app_store_order_id      :bigint(8)
#  payer_id(支付者)           :bigint(8)
#  currency_id(支付币种)      :bigint(8)
#  total                      :decimal(, )
#  state(支付状态)            :string
#  number(支付编号)           :string
#  memo(备注)                 :string
#  completed_at(支付完成时间) :datetime
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_mx_app_store_payments_on_currency_id            (currency_id)
#  index_mx_app_store_payments_on_mx_app_store_order_id  (mx_app_store_order_id)
#  index_mx_app_store_payments_on_payer_id               (payer_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (mx_app_store_order_id => mx_app_store_orders.id)
#  fk_rails_...  (payer_id => mx_app_users.id)
#

FactoryBot.define do
  factory :mx_app_store_payment do
    
  end
end
