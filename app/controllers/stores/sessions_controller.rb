class Stores::SessionsController < Stores::BaseController
  skip_before_action :authenticate_user!, only: [:new, :create, :failure]
  skip_before_action :verify_authenticity_token, only: [:create]

  def new
    redirect_to current_store.mixin_api.request_oauth
  end

  def create
    code = params[:code]
    user = current_store.auth_user_from_mixin(code)
    circle_app_user = current_store.circle_app_users.find_or_create_by(user: user)
    user_sign_in(circle_app_user) if circle_app_user

    redirect_to store_root_path(current_store)
  end

  def failure
    redirect_to store_root_path(current_store)
  end

  def destroy
    user_sign_out
    redirect_back(fallback_location: store_root_path(current_store))
  end
end
