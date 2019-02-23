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
    redirect_to circle_intro_path(current_circle) unless current_circle_user
  end

  def authenticate_member!
    redirect_to circle_intro_path(current_circle) unless current_circle_user&.member?
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

  def circle_props
    {
      circle: { 
        name: current_circle.name, 
        is_binded: current_circle.binded?, 
        introduction: current_circle.introduction, 
        fee_limited: current_circle.fee_limited?, 
        holder_limited: current_circle.holder_limited?, 
        fee_amount: current_circle.fee_amount,
        holder_limit_amount: current_circle.holder_limit_amount,
        avatar_url: current_circle.avatar_url,
        fee_currency: {
          symbol: current_circle.fee_currency.symbol
        },
        holder_limit_currency: {
          symbol: current_circle.holder_limit_currency.symbol
        },
        owner: {
          name: current_circle.owner.name,
          avatar_url: current_circle.owner.avatar_url
        }
      },
      me: { 
        is_logged_in: current_circle_user.present?, 
        is_member: current_circle_user&.member? ,
        holder_limited: current_circle_user&.holder_limited?
      },
      base_url: format('/circles/%s', current_circle.number)
    }
  end
end
