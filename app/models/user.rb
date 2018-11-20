# == Schema Information
#
# Table name: users
#
#  id                       :bigint(8)        not null, primary key
#  name(用户名)                :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  phone(手机号)               :string
#  identity_number(mixin 号) :string
#
# Indexes
#
#  index_users_on_identity_number  (identity_number) UNIQUE
#

class User < ApplicationRecord
  include Authenticatable

  has_many :user_authorizations
  has_one :mixin_authorization, -> { where(provider: :mixin) }, class_name: 'UserAuthorization'

  has_many :mx_apps, foreign_key: 'owner_id'
  has_many :store_apps, foreign_key: 'owner_id'
  has_many :store_apps, foreign_key: 'owner_id'

  validates :name, presence: true

  before_validation :set_profile

  def avatar_url
    mixin_authorization.raw.fetch('avatar_url')
  end

  private

  def set_profile
    self.name   = mixin_authorization&.raw['full_name']
    self.identity_number = mixin_authorization&.raw['identity_number']
    self.phone  = mixin_authorization&.raw['phone']
  end
end
