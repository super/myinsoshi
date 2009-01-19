class ForumsController < ApplicationController
  def index
    @forum = Forum.find(:all)
   # @topics = Topic.find_all_by_forum_id(@forum)
    @topics = Topic.paginate :all, :page => params[:page], :order => 'created_at DESC'
  end
end
