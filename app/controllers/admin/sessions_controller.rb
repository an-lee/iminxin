class Admin::SessionsController < Admin::BaseController
  layout false

  skip_before_action :authenticate_admin!, only: [:new, :create]

  def new
  end

  def create
    admin = Administrator.find_by(name: params[:name])
    if admin && admin.authenticate(params[:password])
      admin_sign_in(admin)
      redirect_to admin_root_path
    else
      flash.now[:alert] = '你输入的用户名或者密码错误'
      render 'new'
    end
  end

  def destroy
    admin_sign_out
    redirect_to admin_login_path
  end
end
