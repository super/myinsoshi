class MessagesController < ApplicationController
  def index
  end
  def new
    @message = Message.new
    @recipient = User.find(params[:user_id])
  end
  def create
    if @recipient_id = User.find(params[:recipient_id])
    @message = Message.create(:recipient_id => @recipient_id,
                              :user_id => logged_in_user.id,
                              :title => params[:message][:title],
                              :body => params[:message][:body])
    flash[:notice] = "发送成功"
    redirect_to user_messages_path
    else
      flash[:notice] = "error #{@recipient_id}"
    end
  end
end
