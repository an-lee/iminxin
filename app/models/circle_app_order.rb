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
end
