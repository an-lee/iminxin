class Stores::BaseController < ActionController::Base
  layout 'store_app'

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :current_store
  helper_method :current_store_user
  helper_method :browser_mobile

  private

  def authenticate_user!
    redirect_to store_login_path(current_store) unless current_store_user
  end

  def current_store
    @_current_store ||= StoreApp.find_by(number: params[:store_number])
  end

  def current_store_user
    @current_store_user ||= session[:current_store_user_id] && current_store.store_app_users.find_by(id: session[:current_store_user_id])
  end

  def user_sign_in(mx_app_user)
    session[:current_store_user_id] = mx_app_user.id
  end

  def user_sign_out
    session[:current_store_user_id] = nil
    @current_store_user = nil
  end

  def browser_mobile
    browser.device.mobile?
  end
end
