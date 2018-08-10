require 'base64'
require 'openssl'
require 'jwt'
require 'jose'
require_relative './mixin_bot/api'

module MixinBot
  def self.api(options = nil)
    options ||= {
      client_id: Figaro.env.MIXIN_CLIENT_ID,
      client_secret: Figaro.env.MIXIN_CLIENT_SECRET,
      session_id: Figaro.env.MIXIN_SESSION_ID,
      pin_token: Figaro.env.MIXIN_PIN_TOKEN,
      private_key: Figaro.env.MIXIN_PRIVATE_KEY
    }

    @api ||= MixinBot::API.new(options)
  end
end
