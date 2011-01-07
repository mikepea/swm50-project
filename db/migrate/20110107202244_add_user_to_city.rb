class AddUserToCity < ActiveRecord::Migration
  def self.up
    add_column :cities, :user_id, :integer
  end

  def self.down
    remove_column :cities, :user_id
  end
end
