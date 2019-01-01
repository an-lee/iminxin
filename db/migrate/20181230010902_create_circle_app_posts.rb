class CreateCircleAppPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :circle_app_posts do |t|
      t.references :author, foreign_key: { to_table: :mx_app_users }
      t.references :circle_app, foreign_key: { to_table: 'mx_apps' }
      t.text :content
      t.timestamps
    end
  end
end
