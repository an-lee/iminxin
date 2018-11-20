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

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
