class ForumsController < ApplicationController
  def index
    @forum = Forum.find(:all)
    @topics = Topic.find_all_by_forum_id(@forum)
  end
end
