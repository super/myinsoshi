class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.integer :recipient_id
      t.datetime :user_delete_at
      t.datetime :recipient_delete_at
      t.datetime :user_read_at
      t.datetime :recipient_read_at
      t.timestamps
    end
    add_index :messages, :user_id
    add_index :messages, :recipient_id
  end

  def self.down
    drop_table :messages
  end
end
