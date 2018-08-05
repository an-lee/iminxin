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

FactoryBot.define do
  factory :mx_app do
    
  end
end
