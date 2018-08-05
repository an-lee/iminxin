class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, comment: '用户名'
      t.timestamps
    end
  end
end
