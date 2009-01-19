class Addblogcolumne < ActiveRecord::Migration
  def self.up
    add_column :blogs, :title, :string
    add_column :blogs, :body, :text
  end
  def self.down
    remove_column :blogs, :title
    remove_column :blogs, :body
  end
end
