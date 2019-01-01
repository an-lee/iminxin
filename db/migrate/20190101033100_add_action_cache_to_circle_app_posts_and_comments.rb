class AddActionCacheToCircleAppPostsAndComments < ActiveRecord::Migration[5.2]
  def change
    add_column :circle_app_posts, :likes_count, :integer, default: 0
    add_column :circle_app_comments, :likes_count, :integer, default: 0
  end
end
