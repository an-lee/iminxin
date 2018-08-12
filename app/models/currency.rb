# == Schema Information
#
# Table name: currencies
#
#  id                                :bigint(8)        not null, primary key
#  name(mixin 中的 name)             :string
#  symbol(mixin 中的 symbol)         :string
#  icon_url(mixin 中的 icon_url)     :string
#  asset_id(mixin 中的 asset_id)     :string
#  chain_id(mixin 中的 chain_id)     :string
#  price_btc(mixin 中的 price_btc)   :string
#  price_usd(mixin 中的 price_usd)   :string
#  change_btc(mixin 中的 change_btc) :string
#  change_usd(mixin 中的 change_usd) :string
#  synced_at(同步价格时间)           :datetime
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#

class Currency < ApplicationRecord
end
