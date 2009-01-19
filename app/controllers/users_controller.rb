class UsersController < ApplicationController
  def index
   # @users = User.find(:all, :limit => 6, :order => 'created_at DESC')
  @users = User.paginate :all, :page => params[:page], :order => 'created_at DESC'
  end
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
    @user = User.find(params[:id])
    if @user.description.blank?
      flash[:error] = "您的个性签名不完善"
    end
    @blogs = @user.blogs.paginate :all,:page => params[:page], :order => 'created_at DESC'
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
     if User.change_password(params[:id],params[:current_password],params[:password])
       @user.update_attributes(params[:user])
      flash[:notice] = "密码修改成功"
     redirect_to :action => 'show'
     else
      render :action => 'edit'
     end
    end
  end
end
