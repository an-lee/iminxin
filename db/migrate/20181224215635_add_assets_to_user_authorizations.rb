class AddAssetsToUserAuthorizations < ActiveRecord::Migration[5.2]
  def change
    add_column :user_authorizations, :assets, :json, comment: '资产信息'
  end
end
