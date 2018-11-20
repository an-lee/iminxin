module Authenticatable
  extend ActiveSupport::Concern

  class_methods do
    def auth_from_mixin(code)
      access_token = MixinBot.api.oauth_token(code)
      profile = MixinBot.api.read_me(access_token).fetch('data', nil)

      raise 'No user profile found!' unless profile.present?

      auth = UserAuthorization.find_or_create_by!(uid: profile.fetch('user_id'), provider: :mixin)
      raw = (auth.raw.presence || {}).merge(profile)
      auth.raw = raw
      auth.update! raw: raw if auth.raw_changed?

      user = find_or_create_by!(mixin_authorization: auth)

      user
    end
  end
end
