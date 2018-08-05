class CreateUserAuthorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_authorizations, comment: '用户认证' do |t|
      t.references :user, foreign_key: true
      t.integer :provider, comment: '第三方来源'
      t.string :uid, comment: '第三方 user_id'
      t.json :raw, comment: '第三方返回的原始数据'
      t.timestamps
    end
    add_index :user_authorizations, [:provider, :uid], unique: true
  end
end
