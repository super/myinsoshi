class AccountController < ApplicationController
  def new
  end
  def create
    if request.post?
      reset_session
      @user = User.authenticate(params[:email],params[:password])
      if @user
        self.logged_in_user=@user
        flash[:notice] = "登录成功。#{logged_in_user.username}"
        redirect_to home_path
      else
        flash[:error] = "用户名／密码错误，请重新输入！"
        redirect_to :action => 'new'
      end
    end
  end
  def destroy
    reset_session
    flash[:notice] = "您已经登出了！"
    redirect_to login_path
  end
end
