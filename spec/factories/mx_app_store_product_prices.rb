# == Schema Information
#
# Table name: mx_app_store_product_prices
#
#  id                            :bigint(8)        not null, primary key
#  mx_app_store_product_id(关联商品) :bigint(8)
#  currency_id(关联货币)             :bigint(8)
#  value(价格)                     :decimal(, )
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
# Indexes
#
#  index_mx_app_store_product_prices_on_currency_id              (currency_id)
#  index_mx_app_store_product_prices_on_mx_app_store_product_id  (mx_app_store_product_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (mx_app_store_product_id => mx_app_store_products.id)
#

FactoryBot.define do
  factory :mx_app_store_product_price do
    
  end
end
