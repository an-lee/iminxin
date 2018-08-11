# == Schema Information
#
# Table name: administrators
#
#  id                    :bigint(8)        not null, primary key
#  name(账号)            :string           not null
#  password_digest(密码) :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_administrators_on_name  (name) UNIQUE
#

FactoryBot.define do
  factory :administrator do
    
  end
end
