module Authenticatable
  extend ActiveSupport::Concern

  class_methods do
    def auth_from_mixin(code)
      access_token = MixinBot.api_auth.oauth_token(code)
      profile = MixinBot.api_me.read_profile(access_token).fetch('data', nil)

      raise 'No user profile found!' unless profile.present?

      auth = UserAuthorization.find_or_create_by!(uid: profile.fetch('user_id'), provider: :mixin)
      raw = (auth.raw.presence || {}).merge(profile)
      auth.update! raw: raw

      user = create_with(name: auth.raw.fetch('full_name')).find_or_create_by!(mixin_authorization: auth)
      user.name = raw.fetch('full_name')
      user.update! name: auth.raw.fetch('full_name') if user.changed?

      user
    end
  end
end
