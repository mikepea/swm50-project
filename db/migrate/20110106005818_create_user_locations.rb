class CreateUserLocations < ActiveRecord::Migration
  def self.up
    create_table :user_locations do |t|
      t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_locations
  end
end
