class MxApps::Circle::BasicSettingsController < MxApps::Circle::BaseController
  before_action :add_index_breadcrumb

  def edit
  end

  def update
    if current_circle.circle_app_setting.update(setting_params)
      redirect_to edit_mx_app_circle_basic_setting_path(current_circle), notice: '成功更新'
    else
      render :edit
    end
  end

  private

  def setting_params
    params.require(:circle_app_setting).permit(:introduction)
  end

  def add_index_breadcrumb
    add_breadcrumb '基本设置', edit_mx_app_circle_basic_setting_path(current_circle)
  end
end
