# == Schema Information
#
# Table name: mx_app_users
#
#  id           :bigint(8)        not null, primary key
#  mx_app_id    :bigint(8)
#  user_id      :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  type(STI)    :string
#
# Indexes
#
#  index_mx_app_users_on_mx_app_id  (mx_app_id)
#  index_mx_app_users_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (mx_app_id => mx_apps.id)
#  fk_rails_...  (user_id => users.id)
#

class MxAppUser < ApplicationRecord
  belongs_to :mx_app
  belongs_to :user

  delegate :name, :avatar_url, :phone, :identity_number, to: :user
end
