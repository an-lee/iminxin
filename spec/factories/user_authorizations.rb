# == Schema Information
#
# Table name: user_authorizations
#
#  id                        :bigint(8)        not null, primary key
#  user_id                   :bigint(8)
#  provider(第三方来源)      :integer
#  uid(第三方 user_id)       :string
#  raw(第三方返回的原始数据) :json
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_user_authorizations_on_provider_and_uid  (provider,uid) UNIQUE
#  index_user_authorizations_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :user_authorization do
    
  end
end
