class CreateStoreWeappAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :store_weapp_addresses do |t|
      t.references :store_app_order
      t.string :user_name
      t.string :phone
      t.string :province
      t.string :city
      t.string :county
      t.string :detail
      t.timestamps
    end
  end
end
