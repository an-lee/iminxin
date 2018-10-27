# == Schema Information
#
# Table name: mx_app_attachments
#
#  id           :bigint(8)        not null, primary key
#  mx_app_id    :bigint(8)
#  file(文件)   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_mx_app_attachments_on_mx_app_id  (mx_app_id)
#
# Foreign Keys
#
#  fk_rails_...  (mx_app_id => mx_apps.id)
#

require 'rails_helper'

RSpec.describe MxAppAttachment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
