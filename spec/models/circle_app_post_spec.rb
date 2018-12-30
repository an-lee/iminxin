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

require 'rails_helper'

RSpec.describe CircleAppPost, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
