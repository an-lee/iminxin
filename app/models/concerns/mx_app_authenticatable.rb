module MxAppAuthenticatable
  extend ActiveSupport::Concern

  def auth_user_from_mixin(code)
    access_token = mixin_api.oauth_token(code)
    profile = mixin_api.read_me(access_token).fetch('data', nil)

    raise 'No user profile found!' unless profile.present?

    auth = UserAuthorization.find_or_create_by!(uid: profile.fetch('user_id'), provider: :mixin)
    raw = (auth.raw.presence || {}).merge(profile)
    auth.update! raw: raw

    user = users.create_with(name: auth.raw.fetch('full_name')).find_or_create_by!(mixin_authorization: auth)
    user.name = raw.fetch('full_name')
    user.update! name: auth.raw.fetch('full_name') if user.changed?

    user
  end
end
