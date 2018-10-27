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

FactoryBot.define do
  factory :store_app_product do

  end
end
