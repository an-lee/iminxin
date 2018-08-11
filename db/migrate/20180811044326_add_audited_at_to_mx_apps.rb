class AddAuditedAtToMxApps < ActiveRecord::Migration[5.2]
  def change
    add_column :mx_apps, :audited_at, :datetime, comment: 'mixin账号审核时间'
  end
end
