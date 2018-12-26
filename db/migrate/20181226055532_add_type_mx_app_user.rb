class AddTypeMxAppUser < ActiveRecord::Migration[5.2]
  def change
    add_column :mx_app_users, :type, :string, comment: 'STI'
  end
end
