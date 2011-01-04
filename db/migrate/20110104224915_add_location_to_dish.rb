class AddLocationToDish < ActiveRecord::Migration
  def self.up
    add_column :dishes, :location_id, :integer
  end

  def self.down
    remove_column :dishes, :location_id
  end
end
