module MixinBot
  module API
    class Me
      attr_reader :client

      def initialize
        @client = Client.new
      end

      def read_profile(access_token=nil)
        path = '/me'
        access_token ||= MixinBot.api_auth.access_token('GET', path, '')
        authorization = format('Bearer %s', access_token)
        client.get(path, headers: { 'Authorization': authorization })
      end

      def update_profile(full_name, avatar_base64, access_token=nil)
        path = '/me'
        payload = {
          "full_name": full_name,
          "avatar_base64": avatar_base64
        }
        access_token ||= MixinBot.api_auth.access_token('POST', path, payload.to_json)
        authorization = format('Bearer %s', access_token)
        client.post(path, headers: { 'Authorization': authorization }, json: payload)
      end

      def read_assets(access_token=nil)
        path = '/assets'
        access_token ||= MixinBot.api_auth.access_token('GET', path, '')
        authorization = format('Bearer %s', access_token)
        client.get(path, headers: { 'Authorization': authorization })
      end

      def read_asset(asset_id, access_token=nil)
        path = format('/assets/%s', asset_id)
        access_token ||= MixinBot.api_auth.access_token('GET', path, '')
        authorization = format('Bearer %s', access_token)
        client.get(path, headers: { 'Authorization': authorization })
      end

      def read_friends(access_token=nil)
        path = '/friends'
        access_token ||= MixinBot.api_auth.access_token('GET', path, '')
        authorization = format('Bearer %s', access_token)
        client.get(path, headers: { 'Authorization': authorization })
      end
    end
  end
end
