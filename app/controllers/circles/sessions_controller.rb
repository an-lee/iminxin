class Circles::SessionsController < Circles::BaseController
  skip_before_action :authenticate_user!, only: [:new, :create, :failure]
  skip_before_action :authenticate_member!
  skip_before_action :verify_authenticity_token, only: [:create]

  def new
    scope =
      if current_circle.holder_limited?
        'PROFILE:READ+PHONE:READ+ASSETS:READ'
      else
        'PROFILE:READ+PHONE:READ'
      end
    redirect_to current_circle.mixin_api.request_oauth(scope: scope)
  end

  def create
    code = params[:code]
    user = current_circle.auth_user_from_mixin(code)
    circle_app_user = current_circle.circle_app_users.find_or_create_by(user: user)
    user_sign_in(circle_app_user) if circle_app_user

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
