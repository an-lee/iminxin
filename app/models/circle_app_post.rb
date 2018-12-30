# == Schema Information
#
# Table name: circle_app_posts
#
#  id            :bigint(8)        not null, primary key
#  author_id     :bigint(8)
#  circle_app_id :bigint(8)
#  content       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_circle_app_posts_on_author_id      (author_id)
#  index_circle_app_posts_on_circle_app_id  (circle_app_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => mx_app_users.id)
#

class CircleAppPost < ApplicationRecord
  belongs_to :author, class_name: 'CircleAppUser'
  belongs_to :circle_app

  validate :content
end
