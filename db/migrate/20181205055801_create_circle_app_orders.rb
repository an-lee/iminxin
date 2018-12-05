class CreateCircleAppOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :circle_app_orders, comment: '新圈子订单' do |t|
      t.references :circle_app, foreign_key: { to_table: 'mx_apps' }
      t.references :buyer, foreign_key: { to_table: 'mx_app_users' }, comment: ' 买家'
      t.references :currency, foreign_key: true, comment: '支付币种'
      t.decimal :total, comment: '订单总价'
      t.string :number, comment: '订单编号'
      t.string :state, comment: '订单状态'
      t.datetime :completed_at, comment: '订单完成时间'
      t.timestamps
    end
  end
end
