class CreateMxAppUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :mx_app_users, comment: 'mixin 应用的用户' do |t|
      t.references :mx_app, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
