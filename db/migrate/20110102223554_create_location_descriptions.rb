class CreateLocationDescriptions < ActiveRecord::Migration
  def self.up
    create_table :location_descriptions do |t|
      t.integer :location_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :location_descriptions
  end
end
