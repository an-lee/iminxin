module MixinBot
  def self.api_me
    @api_me ||= MixinBot::API::Me.new
  end

  def self.api_user
    @api_user ||= MixinBot::API::User.new
  end

  def self.api_payment
    @api_payment ||= MixinBot::API::Payment.new
  end

  def self.api_transfer
    @api_transfer ||= MixinBot::API::Transfer.new
  end

  def self.api_auth
    @api_auth ||= MixinBot::API::Auth.new(
      client_id: Figaro.env.MIXIN_CLIENT_ID,
      client_secret: Figaro.env.MIXIN_CLIENT_SECRET,
      session_id: Figaro.env.MIXIN_SESSION_ID,
      pin_token: Figaro.env.MIXIN_PIN_TOKEN,
      private_key: Figaro.env.MIXIN_PRIVATE_KEY
    )
  end

  def self.api_pin
    @api_pin ||= MixinBot::API::Pin.new(
      session_id: Figaro.env.MIXIN_SESSION_ID,
      pin_token: Figaro.env.MIXIN_PIN_TOKEN,
      private_key: Figaro.env.MIXIN_PRIVATE_KEY
    )
  end
end
