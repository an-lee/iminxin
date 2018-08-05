# == Schema Information
#
# Table name: administrators
#
#  id              :bigint(8)        not null, primary key
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Administrator, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
