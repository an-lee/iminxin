class CreateCircleAppComments < ActiveRecord::Migration[5.2]
  def change
    create_table :circle_app_comments do |t|
      t.references :author, foreign_key: { to_table: :mx_app_users }
      t.references :circle_app_post, foreign_key: true
      t.text :content
      t.timestamps
    end
  end
end
