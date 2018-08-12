class MxApps::Store::BaseController < MxApps::BaseController
  layout 'mx_apps'

  helper_method :current_store

  private

  def current_store
    @_current_store ||= MxAppStore.find_by(number: params[:mx_app_number])
  end
end
