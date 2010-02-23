class CreateApiKeys < ActiveRecord::Migration
  def self.up
    create_table :api_keys do |t|
      t.integer :uid
      t.string :key
      t.datetime :last_updated_at
      t.integer :user_id
      t.boolean :working, :default => false
      t.boolean :full, :default => false
      t.timestamps
    end
    add_index :api_keys, :user_id
    add_index :api_keys, :uid
  end

  def self.down
    drop_table :api_keys
  end
end
