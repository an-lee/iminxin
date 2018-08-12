class Stores::SessionsController < Stores::BaseController
  skip_before_action :authenticate_user!, only: [:new, :create, :failure]
  skip_before_action :verify_authenticity_token, only: [:create]

  def new
    redirect_to MixinBot.api.request_oauth('PROFILE:READ+PHONE:READ')
  end

  def create
    code = params[:code]
    user = MxAppUser.auth_from_mixin(code)
    user_sign_in(user) if user

    redirect_to store_path(current_store)
  end

  def failure
    redirect_to store_path(current_store)
  end

  def destroy
    user_sign_out
    redirect_back(fallback_location: store_path(current_store))
  end
end
