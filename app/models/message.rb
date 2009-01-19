class Message < ActiveRecord::Base
  belongs_to :user
  def recipient
    @recipient
  end
end
