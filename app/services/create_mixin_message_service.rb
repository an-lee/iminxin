class CreateMixinMessageService
  def call(message)
    EM.run {
      access_token = MixinBot.api.access_token('GET', '/', '')
      authorization = format('Bearer %s', access_token)
      ws = Faye::WebSocket::Client.new('wss://blaze.mixin.one/', ["Mixin-Blaze-1"],
        :headers => { 'Authorization' => authorization }
      )

      conversation_id = '204c0633-ef55-38c3-bbf7-4069cd6661bb'
      user_id = '7ed9292d-7c95-4333-aa48-a8c640064186'

      ws.on :open do |event|
        p [:open]
        # data = MixinBot.api.list_pending_message
        msg = MixinBot.api.plain_text_message(conversation_id, user_id, message)
        ws.send(msg)
      end

      ws.on :message do |event|
        p [:message]
        raw = JSON.parse MixinBot.api.read_message(event.data)

        ws.close
        return raw['data']
      end

      ws.on :error do |event|
        p [:error]
        return 'error'
      end

      ws.on :close do |event|
        p [:close, event.code, event.reason]
        ws = nil
      end
    }
  end
end
