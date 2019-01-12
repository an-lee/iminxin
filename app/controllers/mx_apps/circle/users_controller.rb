class MxApps::Circle::UsersController < MxApps::Circle::BaseController
  def index
    q = params[:q].to_s.strip
    q_ransack = { user_name_cont: q, user_phone_cont: q }

    users = current_circle.circle_app_users.ransack(q_ransack.merge(m: 'or')).result

    @users = users.order(created_at: :desc).page(params[:page])
    @users_count = users.count
  end
end
