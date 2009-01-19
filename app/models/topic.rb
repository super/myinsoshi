class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum, :counter_cache => true
  cattr_reader :per_page
  @@per_page = 2
end
