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

class MxApp < ApplicationRecord
  include Numbering
  include SoftDeletable
  include MxAppAuthenticatable

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :mx_app_users
  has_many :users, through: :mx_app_users

  before_validation :setup_identity_number, if: -> { raw_changed? }

  # validates :client_id, presence: true, on: :update
  # validates :client_secret, presence: true, on: :update
  # validates :session_id, presence: true, on: :update
  # validates :pin_token, presence: true, on: :update
  # validates :private_key, format: { with: /\A-----BEGIN RSA PRIVATE KEY-----/i }, on: :update

  def to_param
    number
  end

  def avatar_url
    raw&.fetch('avatar_url') || '/logo.png'
  end

  def mixin_api
    MixinBot::API.new({
      client_id: client_id,
      client_secret: client_secret,
      session_id: session_id,
      pin_token: pin_token,
      private_key: private_key
    })
  end

  def bind!
    r = mixin_api.read_me
    if r['error'].present?
      update! binded_at: nil
    else
      update! raw: r['data']
      touch :binded_at
    end
  end

  def binded?
    binded_at?
  end

  def get_user_conversation_id(user)
    res = mixin_api.read_conversation_by_user_id
  end

  private

  def setup_identity_number
    self.identity_number = raw['identity_number']
  end
end
