# == Schema Information
#
# Table name: mx_app_store_products
#
#  id                     :bigint(8)        not null, primary key
#  mx_app_store_id        :bigint(8)
#  number(商品编号)       :string
#  name(商品名)           :string
#  cover(封面)            :string
#  introduction(商品介绍) :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_mx_app_store_products_on_mx_app_store_id  (mx_app_store_id)
#
# Foreign Keys
#
#  fk_rails_...  (mx_app_store_id => mx_apps.id)
#

class MxAppStoreProduct < ApplicationRecord
  has_many :mx_app_store_product_prices
  has_many :supported_prices, through: :mx_app_store_product_prices
  has_one :base_price, through: :mx_app_store_product_prices

  def to_param
    number
  end
end
