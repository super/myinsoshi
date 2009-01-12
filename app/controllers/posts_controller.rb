class PostsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id], :include => :forum)
    @posts = Post.find_all_by_topic_id(@topic, :order => 'created_at DESC')
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.create(:content => params[:post][:content],
                        :topic_id => params[:topic_id],
                        :user_id => logged_in_user.id)
    flash[:notice] = "帖子发表成功"
    redirect_to :action => 'index'
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "帖子修改成功！"
      redirect_to forum_topic_posts_path
   end
  end
end
