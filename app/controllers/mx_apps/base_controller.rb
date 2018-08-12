class MxApps::BaseController < ApplicationController
  layout 'mx_apps'

  before_action :authenticate_mx_app!

  helper_method :current_mx_app

  private

  def authenticate_mx_app!
    redirect_to root_path unless current_mx_app
  end

  def current_mx_app
    @_current_mx_app ||= MxApp.find_by(number: params[:mx_app_number])
  end
end
