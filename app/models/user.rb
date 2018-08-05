# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  include Authenticatable

  has_many :user_authorizations
  has_one :mixin_authorization, -> { where(provider: :mixin) }, class_name: 'UserAuthorization'

  validates :name, presence: true

  def phone
    mixin_authorization.raw.fetch('phone')
  end

  def avatar_url
    mixin_authorization.raw.fetch('avatar_url')
  end
end
