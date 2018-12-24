# == Schema Information
#
# Table name: users
#
#  id                        :bigint(8)        not null, primary key
#  name(用户名)              :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  phone(手机号)             :string
#  identity_number(mixin 号) :string
#
# Indexes
#
#  index_users_on_identity_number  (identity_number) UNIQUE
#

FactoryBot.define do
  factory :user do
    
  end
end
