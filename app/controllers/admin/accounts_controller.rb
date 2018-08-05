class Admin::AccountsController < Admin::BaseController
  def edit
  end

  def update
    if current_admin.authenticate(params.require(:administrator)[:current_password])
      if current_admin.update(admin_params)
        admin_sign_out
        redirect_to admin_login_path, notice: '帐号已更新，请重新登录'
      else
        render 'edit'
      end
    else
      flash.now[:alert] = '你输入的当前密码不正确'
      render 'edit'
    end
  end

  private

  def admin_params
    params.require(:administrator).permit(:name, :password, :password_confirmation)
  end
end
