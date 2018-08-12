class Stores::BaseController < ActionController::Base
  layout 'mx_app_store'

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :current_store
  helper_method :current_user
  helper_method :browser_mobile

  private

  def authenticate_user!
    redirect_to store_login_path(current_store) unless current_user
  end

  def current_store
    @_current_store ||= MxAppStore.find_by(number: params[:store_number])
  end

  def current_user
    @current_user ||= session[:current_user_id] && current_store.users.find_by(id: session[:current_user_id])
  end

  def user_sign_in(user)
    session[:current_user_id] = user.id
  end

  def user_sign_out
    session[:current_user_id] = nil
    @current_user = nil
  end

  def browser_mobile
    browser.device.mobile?
  end
end
