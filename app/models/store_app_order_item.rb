# == Schema Information
#
# Table name: store_app_order_items
#
#  id                     :bigint(8)        not null, primary key
#  store_app_order_id     :bigint(8)
#  store_app_product_id   :bigint(8)
#  currency_id(支付币种)      :bigint(8)
#  price(单价)              :decimal(, )
#  quantity(数量)           :integer
#  snapshot(商品快照)         :json
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_store_app_order_items_on_currency_id           (currency_id)
#  index_store_app_order_items_on_store_app_order_id    (store_app_order_id)
#  index_store_app_order_items_on_store_app_product_id  (store_app_product_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (store_app_order_id => store_app_orders.id)
#  fk_rails_...  (store_app_product_id => store_app_products.id)
#

class StoreAppOrderItem < ApplicationRecord
  belongs_to :store_app_order
  belongs_to :store_app_product
  belongs_to :currency

  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  delegate :cover_url, to: :store_app_product
end
