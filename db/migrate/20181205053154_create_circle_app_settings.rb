class CreateCircleAppSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :circle_app_settings do |t|
      t.references :circle_app, foreign_key: { to_table: 'mx_apps' }
      t.integer :accepted_currency_ids, array: true, comment: '圈内可流通的货币，主要用于打赏'
      t.references :fee_currency, foreign_key: { to_table: 'currencies' }, comment: '入圈费用币种'
      t.decimal :fee_amount, comment: '入圈费用'
      t.references :holder_limit_currency, foreign_key: { to_table: 'currencies' }, comment: ' 持仓限制的币种'
      t.decimal :holder_limit_amount,  comment: ' 持仓限制的数量'
      t.string :state, comment: '状态'
      t.timestamps
    end
  end
end
