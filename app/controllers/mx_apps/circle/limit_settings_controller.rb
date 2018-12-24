class MxApps::Circle::LimitSettingsController < MxApps::Circle::BaseController
  before_action :add_index_breadcrumb

  def edit
  end

  def update
    if current_circle.circle_app_setting.update(setting_params)
      redirect_to edit_mx_app_circle_limit_setting_path(current_circle), notice: '成功更新'
    else
      render :edit
    end
  end

  private

  def setting_params
    params.require(:circle_app_setting).permit(:fee_currency_id, :fee_amount, :holder_limit_currency_id, :holder_limit_amount, accepted_currency_ids: [])
  end

  def add_index_breadcrumb
    add_breadcrumb '入圈条件', edit_mx_app_circle_limit_setting_path(current_circle)
  end
end
