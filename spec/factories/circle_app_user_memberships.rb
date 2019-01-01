# == Schema Information
#
# Table name: circle_app_user_memberships
#
#  id                       :bigint(8)        not null, primary key
#  circle_app_user_id       :bigint(8)
#  expired_at(会员到期时间) :datetime
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_circle_app_user_memberships_on_circle_app_user_id  (circle_app_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (circle_app_user_id => mx_app_users.id)
#

FactoryBot.define do
  factory :circle_app_user_membership do
    
  end
end
