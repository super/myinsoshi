class Addcommentsblogid < ActiveRecord::Migration
  def self.up
    add_column :comments, :blog_id, :integer
  end
  def self.down
    remove_column :comments, :blog_id
  end
end
