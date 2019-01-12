class Admin::MxAppsController < Admin::BaseController
  def index
    q = params[:q].to_s.strip
    q_ransack = { identity_number_cont: q, owner_name_cont: q, owner_phone_cont: q }

    mx_apps = case params[:f]
      when 'all'
        MxApp.all.page(params[:page])
      else
        MxApp.binding.page(params[:page])
      end

    @mx_apps = mx_apps
    @mx_apps_count = mx_apps.count
  end
end
