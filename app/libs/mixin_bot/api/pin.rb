module MixinBot
  module API
    class Pin
      attr_reader :session_id, :pin_code, :pin_token, :private_key
      attr_reader :client

      def initialize(options)
        @session_id = options[:session_id]
        @pin_token = Base64.decode64 options[:pin_token]
        @private_key = OpenSSL::PKey::RSA.new options[:private_key]
        @client = Client.new
      end

      def verify(access_token=nil)
        path = '/pin/verify'
        payload = {
          pin: encrypted_pin
        }

        access_token ||= MixinBot.api_auth.access_token('POST', path, payload.to_json)
        authorization = format('Bearer %s', access_token)
        client.post(path, headers: { 'Authorization': authorization }, json: payload)
      end

      def decrypt(msg)
        msg = Base64.strict_decode64 msg
        iv = msg[0..15]
        cipher = msg[16..47]
        aes_key = JOSE::JWA::PKCS1::rsaes_oaep_decrypt('SHA256', pin_token, private_key, session_id)
        alg = "AES-256-CBC"
        decode_cipher = OpenSSL::Cipher.new(alg)
        decode_cipher.decrypt
        decode_cipher.iv = iv
        decode_cipher.key = aes_key
        plain = decode_cipher.update(cipher)
        return plain
      end

      def encrypt(pin_code)
        aes_key = JOSE::JWA::PKCS1::rsaes_oaep_decrypt('SHA256', pin_token, private_key, session_id)
        ts = Time.now.utc.to_i
        tszero = ts % 0x100
        tsone = (ts % 0x10000) >> 8
        tstwo = (ts % 0x1000000) >> 16
        tsthree = (ts % 0x100000000) >> 24
        tsstring = tszero.chr + tsone.chr + tstwo.chr + tsthree.chr + "\0\0\0\0"
        encrypt_content = pin_code + tsstring + tsstring
        pad_count = 16 - encrypt_content.length % 16
        if pad_count > 0
          padded_content = encrypt_content + pad_count.chr * pad_count
        else
          padded_content = encrypt_content
        end

        alg = "AES-256-CBC"
        aes = OpenSSL::Cipher.new(alg)
        iv = OpenSSL::Cipher.new(alg).random_iv
        aes.encrypt
        aes.key = aes_key
        aes.iv = iv
        cipher = aes.update(padded_content)
        msg = iv + cipher
        return Base64.strict_encode64 msg
      end
    end
  end
end
