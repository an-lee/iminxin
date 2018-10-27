# == Schema Information
#
# Table name: store_app_products
#
#  id                 :bigint(8)        not null, primary key
#  store_app_id       :bigint(8)
#  number(商品编号)       :string
#  name(商品名)          :string
#  introduction(商品介绍) :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_store_app_products_on_store_app_id  (store_app_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_app_id => mx_apps.id)
#

class StoreAppProduct < ApplicationRecord
  include Numbering

  belongs_to :store_app

  has_one :store_app_product_price

  validates :cover, presence: true
  validates :name, presence: true
  validates :introduction, presence: true

  accepts_nested_attributes_for :store_app_product_price

  delegate :value, :display_value, :currency, to: :store_app_product_price

  has_one_attached :cover

  def to_param
    number
  end

  def display_price
    format('%s %s', display_value, currency.symbol)
  end

  def price_value
    display_value
  end

  def cover_url
    cover.attached? ? cover.service_url : '/logo.png'
  end
end
