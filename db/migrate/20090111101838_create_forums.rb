class CreateForums < ActiveRecord::Migration
  def self.up
    create_table :forums do |t|
      t.string :name
      t.text :description
      t.integer :topics_count, :null => false, :default => 0
      t.timestamps
    end
    Forum.create(:name => "My Forum",
                 :description => "Hey..hey..Hey..hey..")
  end
  def self.down
    drop_table :forums
  end
end
