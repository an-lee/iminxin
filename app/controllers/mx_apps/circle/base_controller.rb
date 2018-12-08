class MxApps::Circle::BaseController < MxApps::BaseController
  layout 'mx_apps'

  helper_method :current_circle

  private

  def current_circle
    @_current_circle ||= CircleApp.find_by(number: params[:mx_app_number])
  end
end
