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

require 'rails_helper'

RSpec.describe UserAuthorization, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
