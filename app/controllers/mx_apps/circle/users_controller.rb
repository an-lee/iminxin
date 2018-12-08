class MxApps::Circle::UsersController < MxApps::Circle::BaseController
  def index
    @users = current_circle.users.order(created_at: :desc).page(params[:page])
  end
end
