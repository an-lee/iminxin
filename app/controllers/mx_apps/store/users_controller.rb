class MxApps::Store::UsersController < MxApps::BaseController
  def index
    @users = current_mx_app.users.order(created_at: :desc).page(params[:page])
  end
end
