class CreateCircleAppUserMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :circle_app_user_memberships do |t|
      t.references :circle_app_user, foreign_key: { to_table: :mx_app_users }
      t.datetime :expired_at, comment: '会员到期时间'
      t.timestamps
    end
  end
end
