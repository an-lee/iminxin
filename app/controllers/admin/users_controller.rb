class Admin::UsersController < Admin::BaseController
  def index
    users = User.all.page(params[:page])
    @users = users
    @users_count = users.count
  end
end
