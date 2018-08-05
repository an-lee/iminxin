class CreateMxApps < ActiveRecord::Migration[5.2]
  def change
    create_table :mx_apps, comment: 'mixin 应用' do |t|
      t.references :owner, foreign_key: { to_table: 'users' }
      t.string :type
      t.string :number, comment: '编号'
      t.datetime :deleted_at, comment: '软删'
      t.string :client_id
      t.string :client_secret
      t.string :session_id
      t.string :pin_token
      t.text :private_key
      t.json :raw, comment: 'mixin 返回的 profile'
      t.timestamps
    end

    add_index :mx_apps, :number, unique: true
  end
end
