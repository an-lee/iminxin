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

class Administrator < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_secure_password
end
