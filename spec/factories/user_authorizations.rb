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

FactoryBot.define do
  factory :user_authorization do
    
  end
end
