class CreateCircleAppPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :circle_app_payments do |t|
      t.references :circle_app_order, foreign_key: true
      t.references :payer, foreign_key: { to_table: 'mx_app_users' }, comment: '支付者'
      t.references :currency, foreign_key: true
      t.string :asset_id
      t.string :opponent_id
      t.string :trace_id
      t.decimal :amount
      t.string :memo
      t.string :state
      t.timestamps
    end
  end
end
