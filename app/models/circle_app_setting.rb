# == Schema Information
#
# Table name: circle_app_settings
#
#  id                                                    :bigint(8)        not null, primary key
#  circle_app_id                                         :bigint(8)
#  accepted_currency_ids(圈内可流通的货币，主要用于打赏) :integer          is an Array
#  fee_currency_id(入圈费用币种)                         :bigint(8)
#  fee_amount(入圈费用)                                  :decimal(, )
#  holder_limit_currency_id( 持仓限制的币种)             :bigint(8)
#  holder_limit_amount( 持仓限制的数量)                  :decimal(, )
#  state(状态)                                           :string
#  created_at                                            :datetime         not null
#  updated_at                                            :datetime         not null
#  introduction(介绍)                                    :text
#
# Indexes
#
#  index_circle_app_settings_on_circle_app_id             (circle_app_id)
#  index_circle_app_settings_on_fee_currency_id           (fee_currency_id)
#  index_circle_app_settings_on_holder_limit_currency_id  (holder_limit_currency_id)
#
# Foreign Keys
#
#  fk_rails_...  (circle_app_id => mx_apps.id)
#  fk_rails_...  (fee_currency_id => currencies.id)
#  fk_rails_...  (holder_limit_currency_id => currencies.id)
#

class CircleAppSetting < ApplicationRecord
  belongs_to :circle_app
  belongs_to :fee_currency, class_name: 'Currency', optional: true
  belongs_to :holder_limit_currency, class_name: 'Currency', optional: true
end
