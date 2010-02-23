class CreateConfigurationValues < ActiveRecord::Migration
  def self.up
    create_table :configuration_values do |t|
      t.string :name
      t.string :value
    end
  end

  def self.down
    drop_table :configuration_values
  end
end
