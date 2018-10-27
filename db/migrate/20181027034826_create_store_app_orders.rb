class CreateStoreAppOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :store_app_orders, comment: '商城订单' do |t|
      t.references :store_app, foreign_key: { to_table: 'mx_apps' }
      t.references :buyer, foreign_key: { to_table: 'mx_app_users' }, comment: ' 买家'
      t.references :currency, foreign_key: true, comment: '支付币种'
      t.decimal :total, comment: '订单总价'
      t.decimal :items_total, comment: '商品总价'
      t.decimal :shipment_total, comment: '运费总价'
      t.string :number, comment: '订单编号'
      t.string :state, comment: '订单状态'
      t.string :memo, comment: '备注'
      t.datetime :payment_started_at, comment: '发起支付时间'
      t.datetime :payment_expired_at, comment: '支付超时时间'
      t.datetime :payment_completed_at, comment: '支付完成时间'
      t.datetime :processing_shipment_started_at, comment: '开始发货时间'
      t.datetime :shipment_shipped_at, comment: '发货时间'
      t.datetime :cancelled_at, comment: '订单取消时间'
      t.datetime :completed_at, comment: '订单完成时间'
      t.timestamps
    end
  end
end
