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

class CircleAppUserMembership < ApplicationRecord
  belongs_to :circle_app_user

  def update_1_year_membership!
    update! expired_at: Time.current + 1.year
  end
  
  def activated?
    fee_activated? && holder_activated?
  end

  def fee_activated?
    circle_app = circle_app_user.circle_app
    if circle_app.fee_amount.present?
      return false if expired_at.blank? || expired_at < Time.current
    end

    return true
  end

  def holder_activated?
    circle_app = circle_app_user.circle_app

    if circle_app.holder_limit_amount.present?
      assets = circle_app_user.user.mixin_authorization.assets
      return false if assets.blank?

      asset_index = assets.index { |asset| asset['asset_id'] == circle_app.holder_limit_currency.asset_id }
      return false if assets[asset_index].blank? || assets[asset_index]['balance'].to_f < circle_app.holder_limit_amount
    end

    return true
  end
end
