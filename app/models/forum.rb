class Forum < ActiveRecord::Base
  has_many :topics, :dependent => :nullify
  has_many :posts, :through => :topics
end
