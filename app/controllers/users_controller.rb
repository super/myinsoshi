class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    if request.post?
      @user = User.new(params[:user])
      if @user.save
        self.logged_in_user=@user
        flash[:notice] = "注册成功了。"
        redirect_to home_path
      else
        render :action => 'new'
      end
    end
  end
  def show
    @user = logged_in_user
    if @user.description.blank?
      flash[:error] = "您的个性签名不完善"
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    case params[:type]
    when 'info_edit'
    if @user.update_attributes(params[:user])
      flash[:notice] = '更改用户成功！'
      redirect_to :action => 'show'
    else
      render :action => "edit"
    end
    when 'password_edit'
     if User.change_password(params[:current_password],params[:password])
      flash[:notice] = "密码修改成功"
     redirect_to :action => 'show'
     else
      render :action => 'edit'
     end 
    end
  end
end
