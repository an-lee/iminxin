class CreateAdministrators < ActiveRecord::Migration[5.2]
  def change
    create_table :administrators, comment: '管理员' do |t|
      t.string :name, null: false, comment: '账号'
      t.string :password_digest, null: false, comment: '密码'
      t.timestamps
    end

    add_index :administrators, :name, unique: true
  end
end
