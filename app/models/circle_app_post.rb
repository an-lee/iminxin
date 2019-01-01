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
#  likes_count   :integer          default(0)
#
# Indexes
#
#  index_circle_app_posts_on_author_id      (author_id)
#  index_circle_app_posts_on_circle_app_id  (circle_app_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => mx_app_users.id)
#  fk_rails_...  (circle_app_id => mx_apps.id)
#

class CircleAppPost < ApplicationRecord
  belongs_to :author, class_name: 'CircleAppUser'
  belongs_to :circle_app

  has_many :comments, class_name: 'CircleAppComment', dependent: :destroy

  validates :content, presence: :true
end
