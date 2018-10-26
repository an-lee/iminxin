class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :failure]
  skip_before_action :verify_authenticity_token, only: [:create]

  def new
    redirect_to MixinBot.api.request_oauth
  end

  def create
    code = params[:code]
    user = User.auth_from_mixin(code)
    user_sign_in(user) if user

    redirect_to root_path
  end

  def failure
    redirect_to root_path
  end

  def destroy
    user_sign_out
    redirect_back(fallback_location: root_path)
  end
end
