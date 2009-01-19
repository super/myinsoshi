class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :nullify
  cattr_reader :per_page
  @@per_page = 2
end
