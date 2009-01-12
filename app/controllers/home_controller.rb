class HomeController < ApplicationController
  def index
    @topics = Topic.find(:all, :limit => 3,:order => 'created_at DESC')
  end
end
