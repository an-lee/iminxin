# == Schema Information
#
# Table name: store_weapp_addresses
#
#  id                 :bigint(8)        not null, primary key
#  store_app_order_id :bigint(8)
#  user_name          :string
#  phone              :string
#  province           :string
#  city               :string
#  county             :string
#  detail             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_store_weapp_addresses_on_store_app_order_id  (store_app_order_id)
#

class StoreWeappAddress < ApplicationRecord
  belongs_to :store_app_order

  validates :user_name, presence: true
  validates :phone, presence: true
  validates :province, presence: true
  validates :city, presence: true
  validates :county, presence: true
  validates :detail, presence: true
end
