# == Schema Information
#
# Table name: mx_apps
#
#  id            :bigint(8)        not null, primary key
#  owner_id      :bigint(8)
#  type          :string
#  number        :string
#  deleted_at    :datetime
#  client_id     :string
#  client_secret :string
#  session_id    :string
#  pin_token     :string
#  private_key   :text
#  raw           :json
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class MxApp < ApplicationRecord
  include Numbering
  include SoftDeletable

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :client_id, presence: true
  validates :client_secret, presence: true
  validates :session_id, presence: true
  validates :pin_token, presence: true
  validates :private_key, format: { with: /\A-----BEGIN RSA PRIVATE KEY-----/i }

  def name
    raw&.fetch('full_name', nil)
  end

  def identity_number
    raw&.fetch('identity_number', nil)
  end

  def avatar_url
    raw&.fetch('avatar_url', nil)
  end

  def mixin_api
    MixinBot.api({
      client_id: client_id,
      client_secret: client_secret,
      session_id: session_id,
      pin_token: pin_token,
      private_key: private_key
    })
  end
end
