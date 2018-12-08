class Circles::SessionsController < Circles::BaseController
  skip_before_action :authenticate_user!, only: [:new, :create, :failure]
  skip_before_action :verify_authenticity_token, only: [:create]

  def new
    redirect_to current_circle.mixin_api.request_oauth
  end

  def create
    code = params[:code]
    mx_app_user = current_circle.auth_user_from_mixin(code)
    user_sign_in(mx_app_user) if mx_app_user

    redirect_to circle_root_path(current_circle)
  end

  def failure
    redirect_to circle_root_path(current_circle)
  end

  def destroy
    user_sign_out
    redirect_back(fallback_location: circle_root_path(current_circle))
  end
end
