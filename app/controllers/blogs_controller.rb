class BlogsController < ApplicationController
  def index
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.create(:title => params[:blog][:title],
                        :body => params[:blog][:body],
                        :user_id => logged_in_user.id)
    flash[:notice] = "博客日志创建成功"
    #redirect_to blog_comments_path(:blog_id => @blog)
    redirect_to blog_comments_path(:blog_id => @blog, :user_id => logged_in_user.id)
  end
  def edit
    @blog = Blog.find(params[:id])
  end
  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog])
      flash[:notice ] = "日志更新成功"
      redirect_to blog_comments_path(:blog_id => @blog)
    end
  end
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:notice] = "日志已经删除了"
  end
end
