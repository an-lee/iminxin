class CreateStoreAppProductPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :store_app_product_prices, comment: '商品价格' do |t|
      t.references :store_app_product, foreign_key: true, comment: '关联商品'
      t.references :currency, foreign_key: true, comment: '关联货币'
      t.decimal :value, comment: '价格'
      t.timestamps
    end
  end
end
