class ChangeColumnnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :mx_apps, :audited_at, :binded_at
  end
end
