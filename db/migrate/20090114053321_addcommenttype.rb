class Addcommenttype < ActiveRecord::Migration
  def self.up
    add_column :comments, :comment_type, :string, :default => "", :null => false
  end
  def self.down
    remove_column :comments, :comment_type
  end
end
