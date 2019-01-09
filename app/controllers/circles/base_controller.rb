class Circles::BaseController < ActionController::Base
  include RenderingHelper
  
  layout 'circle_app'

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :authenticate_member!

  helper_method :current_circle
  helper_method :current_circle_user

  private

  def authenticate_user!
    redirect_to circle_login_path(current_circle) unless current_circle_user
  end

  def authenticate_member!
    redirect_to circle_root_path(current_circle) unless current_circle_user.member?
  end

  def current_circle
    @_current_circle ||= CircleApp.find_by(number: params[:circle_number])
  end

  def current_circle_user
    @_current_circle_user ||= session["current_circle_#{current_circle.number}_user_id"] && current_circle.circle_app_users.find_by(id: session["current_circle_#{current_circle.number}_user_id"])
  end

  def user_sign_in(mx_app_user)
    session["current_circle_#{current_circle.number}_user_id"] = mx_app_user.id
  end

  def user_sign_out
    session["current_circle_#{current_circle.number}_user_id"] = nil
    @_current_circle_user = nil
  end
end
