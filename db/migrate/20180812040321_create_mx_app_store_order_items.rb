class CreateMxAppStoreOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :mx_app_store_order_items do |t|
      t.references :mx_app_store_order, foreign_key: true
      t.references :mx_app_store_product, foreign_key: true
      t.references :currency, foreign_key: true, comment: '支付币种'
      t.decimal :price, comment: '单价'
      t.integer :quantity, comment: '数量'
      t.timestamps
    end
  end
end
