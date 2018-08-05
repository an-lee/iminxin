# == Schema Information
#
# Table name: user_authorizations
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  provider   :integer
#  uid        :string
#  raw        :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserAuthorization < ApplicationRecord
  include Enumerize

  belongs_to :user, optional: true

  validates :uid, presence: true, uniqueness: { scope: :provider }

  enumerize :provider, in: { mixin: 0 }, default: 'mixin'
end
