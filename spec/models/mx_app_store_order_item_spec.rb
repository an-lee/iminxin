# == Schema Information
#
# Table name: mx_app_store_order_items
#
#  id                        :bigint(8)        not null, primary key
#  mx_app_store_order_id     :bigint(8)
#  mx_app_store_product_id   :bigint(8)
#  currency_id(支付币种)     :bigint(8)
#  price(单价)               :decimal(, )
#  quantity(数量)            :integer
#  snapshot(商品快照)        :json
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_mx_app_store_order_items_on_currency_id              (currency_id)
#  index_mx_app_store_order_items_on_mx_app_store_order_id    (mx_app_store_order_id)
#  index_mx_app_store_order_items_on_mx_app_store_product_id  (mx_app_store_product_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (mx_app_store_order_id => mx_app_store_orders.id)
#  fk_rails_...  (mx_app_store_product_id => mx_app_store_products.id)
#

require 'rails_helper'

RSpec.describe MxAppStoreOrderItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
