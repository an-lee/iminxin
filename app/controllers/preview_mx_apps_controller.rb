class PreviewMxAppsController < ApplicationController
  before_action :load_mx_app, only: [:show]
  
  def show
    case @mx_app.type
    when 'StoreApp'  then redirect_to store_root_path(@mx_app)
    when 'CircleApp' then redirect_to circle_root_path(@mx_app)
    end
  end

  private

  def load_mx_app
    @mx_app = current_user.mx_apps.find_by(number: params[:number])
  end
end
