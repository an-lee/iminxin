class AuditedMxAppsController < ApplicationController
  before_action :load_mx_app, only: [:show, :edit, :update, :update]

  def update
    @mx_app.audit!

    if @mx_app.audit?
      flash[:notice] = "成功绑定"
    else
      flash[:alert] = "绑定失败，请检查填写的信息是否正确"
    end
    render js: 'Turbolinks.visit()'
  end

  private

  def load_mx_app
    @mx_app = current_user.mx_apps.find_by(number: params[:number])
  end
end
