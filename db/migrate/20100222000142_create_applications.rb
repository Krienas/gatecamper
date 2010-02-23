class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.string :name
      t.string :key
      t.integer :user_id
      t.boolean :disabled, :default => false
      t.timestamps
    end
    add_index :applications, :user_id
    add_index :applications, :key, :unique => true
  end

  def self.down
    drop_table :applications
  end
end
