class MxAppsController < ApplicationController
  layout 'application'
  before_action :load_mx_app, only: [:show, :edit, :update, :update]

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
    @mx_app.update(mx_app_params)
    redirect_to mx_apps_path
  end

  def destroy
    @mx_app.soft_delete!
    renden js: 'Turbolinks.visit()'
  end

  private

  def load_mx_app
    @mx_app = current_user.mx_apps.find_by(number: params[:number])
  end

  def mx_app_params
    params.require(:mx_app).permit(:client_id, :client_secret, :session_id, :pin_token, :private_key, :type)
  end
end
