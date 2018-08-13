class MxAppsController < ApplicationController
  layout 'application'
  before_action :load_mx_app, only: [:show, :edit, :update, :update, :destroy]

  def index
    mx_apps = current_user.mx_apps.order(created_at: :desc)
    @mx_apps = mx_apps.page(params[:page])
  end

  def create
    @mx_app = current_user.mx_app_stores.create!
    redirect_to mx_apps_path
  end

  def show
    case @mx_app.type
    when 'MxAppStore'
      redirect_to mx_app_store_products_path(@mx_app)
    end
  end

  def edit
  end

  def update
    wx_app_params = case @mx_app.type
                    when 'MxAppStore' then mx_app_store_params
                    end

    if @mx_app.update(wx_app_params)
      @mx_app.audit!
      if @mx_app.audited?
        flash[:notice] = "成功绑定"
      else
        flash[:alert] = "绑定失败，请检查填写的信息是否正确"
      end
      redirect_to mx_apps_path
    else
      render :edit
    end
  end

  def destroy
    @mx_app.soft_delete!
    flash[:warning] = "你的机器人已经删除"
    render js: 'Turbolinks.visit()'
  end

  private

  def load_mx_app
    @mx_app = current_user.mx_apps.find_by(number: params[:number])
  end

  def mx_app_store_params
    params.require(:mx_app_store).permit(:client_id, :client_secret, :session_id, :pin_token, :private_key, :type)
  end
end
