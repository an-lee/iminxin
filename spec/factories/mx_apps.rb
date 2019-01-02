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

FactoryBot.define do
  factory :mx_app do
    
  end
end
