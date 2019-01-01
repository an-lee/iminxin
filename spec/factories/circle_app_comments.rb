# == Schema Information
#
# Table name: circle_app_comments
#
#  id                 :bigint(8)        not null, primary key
#  author_id          :bigint(8)
#  circle_app_post_id :bigint(8)
#  content            :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  likes_count        :integer          default(0)
#
# Indexes
#
#  index_circle_app_comments_on_author_id           (author_id)
#  index_circle_app_comments_on_circle_app_post_id  (circle_app_post_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => mx_app_users.id)
#  fk_rails_...  (circle_app_post_id => circle_app_posts.id)
#

FactoryBot.define do
  factory :circle_app_comment do
    
  end
end
