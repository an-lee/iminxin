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

require 'rails_helper'

RSpec.describe MxAppStoreProduct, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
