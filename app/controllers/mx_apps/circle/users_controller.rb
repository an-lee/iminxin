class MxApps::Circle::UsersController < MxApps::Circle::BaseController
  def index
    @users = current_circle.circle_app_users.order(created_at: :desc).page(params[:page])
  end
end
