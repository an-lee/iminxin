module MixinBot
  class API
    module Payment
      def pay_url(options)
        recipient_id = options[:recipient_id]
        asset_id = options[:asset_id]
        amount = options[:amount]
        memo = options[:memo]
        trace = options[:trace]

        url = format('https://mixin.one/pay?recipient=%s&asset=%s&amount=%s&trace=%s&memo=%s', recipient_id, asset_id, amount, trace, memo)

        return URI.parse(url).to_s
      end

      def verify_payment(options)
        recipient_id = options[:recipient_id]
        asset_id = options[:asset_id]
        amount = options[:amount]
        trace = options[:trace]

        path = 'payments'
        payload = {
          asset_id: asset_id,
          opponent_id: recipient_id,
          amount: amount,
          trace_id: trace,
        }
        client.post(path, json: payload)
      end
    end
  end
end
