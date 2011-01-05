class AddUserToLocationDescription < ActiveRecord::Migration
  def self.up
    add_column :location_descriptions, :user_id, :integer
  end

  def self.down
    remove_column :location_descriptions, :user_id
  end
end
