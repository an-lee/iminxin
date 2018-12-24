# == Schema Information
#
# Table name: store_app_product_prices
#
#  id                             :bigint(8)        not null, primary key
#  store_app_product_id(关联商品) :bigint(8)
#  currency_id(关联货币)          :bigint(8)
#  value(价格)                    :decimal(, )
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#
# Indexes
#
#  index_store_app_product_prices_on_currency_id           (currency_id)
#  index_store_app_product_prices_on_store_app_product_id  (store_app_product_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (store_app_product_id => store_app_products.id)
#

class StoreAppProductPrice < ApplicationRecord
  include DisplayPrice

  belongs_to :store_app_product
  belongs_to :currency

  validates :value, numericality: { greater_than_or_equal_to: 0 }

  price_methods :value
end
