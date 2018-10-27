class CreateMxAppStorePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :mx_app_store_payments, comment: '商城支付' do |t|
      t.references :mx_app_store_order, foreign_key: true
      t.references :payer, foreign_key: { to_table: 'mx_app_users' }, comment: '支付者'
      t.references :currency, foreign_key: true, comment: '支付币种'
      t.decimal :total, comment: '对应 mixin 支付中的 amount'
      t.string :state, comment: '支付状态'
      t.string :number, comment: '支付编号，对应 mixin 支付中的 trace_id'
      t.string :memo, comment: '备注'
      t.datetime :completed_at, comment: '支付完成时间'
      t.timestamps
    end
  end
end
