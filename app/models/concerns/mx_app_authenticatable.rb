module MxAppAuthenticatable
  extend ActiveSupport::Concern

  def auth_user_from_mixin(code)
    access_token = mixin_api.oauth_token(code)
    profile = mixin_api.read_me(access_token).fetch('data', nil)
    assets = mixin_api.read_assets(access_token).fetch('data', nil)

    raise 'No user profile found!' unless profile.present?

    auth = UserAuthorization.find_or_create_by!(uid: profile.fetch('user_id'), provider: :mixin)
    raw = (auth.raw.presence || {}).merge(profile)
    auth.raw = raw
    auth.assets = assets
    auth.update! raw: raw, assets: assets if auth.raw_changed? || auth.assets_changed?

    user = User.find_or_create_by!(mixin_authorization: auth)
  end
end
