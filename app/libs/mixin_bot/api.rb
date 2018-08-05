module MixinBot
  class API
    attr_reader :client_id, :client_secret, :session_id, :pin_token, :private_key
    attr_reader :client

    def initialize(options=nil)
      options ||= {
        client_id: Figaro.env.MIXIN_CLIENT_ID,
        client_secret: Figaro.env.MIXIN_CLIENT_SECRET,
        session_id: Figaro.env.MIXIN_SESSION_ID,
        pin_token: Figaro.env.MIXIN_PIN_TOKEN,
        private_key: Figaro.env.MIXIN_PRIVATE_KEY
      }

      @client_id = options[:client_id]
      @client_secret = options[:client_secret]
      @session_id = options[:session_id]
      @pin_token = Base64.decode64 options[:pin_token]
      @private_key = OpenSSL::PKey::RSA.new options[:private_key]
      @client = Client.new
    end

    include MixinBot::API::Auth
    include MixinBot::API::Me
    include MixinBot::API::Payment
    include MixinBot::API::Pin
    include MixinBot::API::Transfer
    include MixinBot::API::User
  end
end
