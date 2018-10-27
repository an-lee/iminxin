class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies, comment: '支持的货币' do |t|
      t.string :name, comment: 'mixin 中的 name'
      t.string :symbol, comment: 'mixin 中的 symbol'
      t.string :icon_url, comment: 'mixin 中的 icon_url'
      t.string :asset_id, comment: 'mixin 中的 asset_id', index: { unique: true }
      t.string :chain_id, comment: 'mixin 中的 chain_id'
      t.decimal :price_btc, comment: 'mixin 中的 price_btc'
      t.decimal :price_usd, comment: 'mixin 中的 price_usd'
      t.decimal :change_btc, comment: 'mixin 中的 change_btc'
      t.decimal :change_usd, comment: 'mixin 中的 change_usd'
      t.datetime :synced_at, comment: '同步价格时间'
      t.timestamps
    end
  end
end
