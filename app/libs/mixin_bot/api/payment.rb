module MixinBot
  module API
    class Payment
      attr_reader :client

      def initialize
        @client = Client.new
      end

      def request_url(options)
        options = options.with_indifferent_access
        recipient_id = options.fetch('recipient_id')
        asset_id = options.fetch('asset_id')
        amount = options.fetch('amount')
        memo = options.fetch('memo')
        trace = options.fetch('trace')
        url = format('https://mixin.one/pay?recipient=%s&asset=%s&amount=%s&trace=%s&memo=%s', recipient_id, asset_id, amount, trace, memo)
      end

      def verify(options)
        options = options.with_indifferent_access
        recipient_id = options.fetch('recipient_id')
        asset_id = options.fetch('asset_id')
        amount = options.fetch('amount')
        trace = options.fetch('trace')
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
