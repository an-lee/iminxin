# == Schema Information
#
# Table name: mx_apps
#
#  id                           :bigint(8)        not null, primary key
#  owner_id                     :bigint(8)
#  type                         :string
#  number(编号)                 :string
#  deleted_at(软删)             :datetime
#  client_id                    :string
#  client_secret                :string
#  session_id                   :string
#  pin_token                    :string
#  private_key                  :text
#  raw(mixin 返回的 profile)    :json
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  binded_at(mixin账号审核时间) :datetime
#  identity_number(mixin 号)    :string
#
# Indexes
#
#  index_mx_apps_on_identity_number  (identity_number) UNIQUE
#  index_mx_apps_on_number           (number) UNIQUE
#  index_mx_apps_on_owner_id         (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#

class CircleApp < MxApp
  has_many :circle_app_users, foreign_key: 'mx_app_id'
  has_many :mx_app_image_attachments, foreign_key: 'mx_app_id'
  has_many :orders, class_name: 'CircleAppOrder'
  has_many :payments, through: :orders, source: :circle_app_payment
  has_many :posts, class_name: 'CircleAppPost'

  has_one :circle_app_setting

  delegate :state, :accepted_currency_ids, :fee_currency, :fee_amount, :holder_limit_currency, :holder_limit_amount, :introduction, to: :circle_app_setting

  after_create :create_circle_app_setting!

  def name
    raw&.fetch('full_name') || 'Xin Circle'
  end

  def fee_limited?
    return fee_currency.present? && fee_amount.to_f > 0
  end

  def holder_limited?
    return holder_limit_currency.present? && holder_limit_amount.to_f > 0
  end
end
