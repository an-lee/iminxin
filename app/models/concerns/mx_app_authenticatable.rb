module MxAppAuthenticatable
  extend ActiveSupport::Concern

  class_methods do
    def mx_app_auth_from_mixin(code)
      access_token = mx_app.mixin_api.oauth_token(code)
      profile = mx_app.mixin_api.read_me(access_token).fetch('data', nil)

      raise 'No user profile found!' unless profile.present?

      auth = UserAuthorization.find_or_create_by!(uid: profile.fetch('user_id'), provider: :mixin)
      raw = (auth.raw.presence || {}).merge(profile)
      auth.update! raw: raw

      user = user.create_with(name: auth.raw.fetch('full_name')).find_or_create_by!(mixin_authorization: auth)
      user.name = raw.fetch('full_name')
      user.update! name: auth.raw.fetch('full_name') if user.changed?

      user
    end
  end
end
