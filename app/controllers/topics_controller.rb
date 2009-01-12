class TopicsController < ApplicationController
  def index
  end
  def new
    @topic = Topic.new
  end
  def create
    @topic = Topic.create(:title => params[:topic][:title],
                       :forum_id => params[:forum_id],
                       :user_id => logged_in_user.id)
    flash[:notice] = "Topic 发表成功！"
    redirect_to forum_topic_posts_path(:forum_id => params[:forum_id],:topic_id => @topic)
  end
  def edit
  end
end
