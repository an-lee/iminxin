# == Schema Information
#
# Table name: mx_app_users
#
#  id           :bigint(8)        not null, primary key
#  mx_app_id    :bigint(8)
#  user_id      :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  type(STI)    :string
#
# Indexes
#
#  index_mx_app_users_on_mx_app_id  (mx_app_id)
#  index_mx_app_users_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (mx_app_id => mx_apps.id)
#  fk_rails_...  (user_id => users.id)
#

class CircleAppUser < MxAppUser
  belongs_to :circle_app, foreign_key: 'mx_app_id'

  has_many :posts, class_name: 'CircleAppPost', foreign_key: 'author_id'
  has_many :comments, class_name: 'CircleAppComment', foreign_key: 'author_id'
  has_many :orders, class_name: 'CircleAppOrder', foreign_key: 'buyer_id'
  has_one :membership, class_name: 'CircleAppUserMembership'

  after_create :create_membership

  action_store :like, :circle_app_post, counter_cache: true

  def owner?
    user == circle_app.owner
  end

  def member?
    owner? || membership.activated?
  end

  def fee_limited?
    !membership.fee_activated?
  end

  def holder_limited?
    !membership.holder_activated?
  end
end
