class Admin::MxAppsController < Admin::BaseController
  def index
    mx_apps = MxApp.all.page(params[:page])
    @mx_apps = mx_apps
    @mx_apps_count = mx_apps.count
  end
end
