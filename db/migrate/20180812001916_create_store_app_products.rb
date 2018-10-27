class CreateStoreAppProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :store_app_products, comment: '电商应用的商品' do |t|
      t.references :store_app, foreign_key: { to_table: 'mx_apps' }
      t.string :number, comment: '商品编号'
      t.string :name, comment: '商品名'
      t.text :introduction, comment: '商品介绍'
      t.timestamps
    end
  end
end
