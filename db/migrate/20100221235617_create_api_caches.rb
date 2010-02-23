class CreateApiCaches < ActiveRecord::Migration
  def self.up
    create_table :api_caches do |t|
      t.string :api_method
      t.integer :uid
      t.text :data
      t.datetime :cached_until
    end
    add_index :api_caches, :api_method
    add_index :api_caches, :uid
  end

  def self.down
    drop_table :api_caches
  end
end
