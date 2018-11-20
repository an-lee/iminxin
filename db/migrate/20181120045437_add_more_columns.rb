class AddMoreColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone, :string, comment: '手机号'
    add_column :users, :identity_number, :string, comment: 'mixin 号'
    add_column :mx_apps, :identity_number, :string, comment: 'mixin 号'

    add_index :users, :identity_number, unique: true
    add_index :mx_apps, :identity_number, unique: true
  end
end
