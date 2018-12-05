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

require 'rails_helper'

RSpec.describe CircleAppPayment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
