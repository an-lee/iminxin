class CreateStoreAppOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :store_app_order_items do |t|
      t.references :store_app_order, foreign_key: true
      t.references :store_app_product, foreign_key: true
      t.references :currency, foreign_key: true, comment: '支付币种'
      t.decimal :price, comment: '单价'
      t.integer :quantity, comment: '数量'
      t.json :snapshot, comment: '商品快照'
      t.timestamps
    end
  end
end
