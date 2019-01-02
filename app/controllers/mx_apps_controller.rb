class MxAppsController < ApplicationController
  layout 'application'
  before_action :load_mx_app, only: [:show, :edit, :update, :update, :destroy]

  def index
    mx_apps = current_user.mx_apps.order(created_at: :desc)
    @mx_apps = mx_apps.page(params[:page])
  end

  def create
    app_klass =
      case params[:type]
      when 'StoreApp' then StoreApp
      when 'CircleApp' then CircleApp
      end

    @mx_app = app_klass.create!(
      owner: current_user
    )

    redirect_to mx_app_path(@mx_app)
  end

  def show
    case @mx_app.type
    when 'StoreApp'  then redirect_to mx_app_store_products_path(@mx_app)
    when 'CircleApp' then redirect_to edit_mx_app_circle_basic_setting_path(@mx_app)
    end
  end

  def edit
  end

  def update
    wx_app_params = case @mx_app.type
                    when 'StoreApp'  then store_app_params
                    when 'CircleApp' then circle_app_params
                    end

    if @mx_app.update(wx_app_params)
      @mx_app.bind!
      if @mx_app.binded?
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

  def store_app_params
    params.require(:store_app).permit(:client_id, :client_secret, :session_id, :pin_token, :private_key, :type)
  end

  def circle_app_params
    params.require(:circle_app).permit(:client_id, :client_secret, :session_id, :pin_token, :private_key, :type)
  end
end
