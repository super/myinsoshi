class CommentsController < ApplicationController
  def index
    @blog = Blog.find(params[:blog_id])
    @user = User.find(params[:user_id])
    @comments = Comment.find_all_by_blog_id(@blog,:limit => 3, :order => 'created_at DESC')
  end
  def new
    @comment = Comment.new
  end
  def create
    @comment = Comment.create(:body => params[:comment][:body],
                              :blog_id => params[:blog_id],
                              :user_id => logged_in_user.id)
    flash[:notice] = "发表评论成功"
    redirect_to blog_comments_path(:blog_id => params[:blog_id])
  end
  def wallcomment
    @comment = Comment.create(:body => params[:comment][:body],
                              :user_id => logged_in_user.id)
    flash[:notice] = "Successfully！！"
    redirect_to user_path
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "评论已删除 "
    redirect_to blog_comments_path(:blog_id => params[:blog_id])
  end
end
