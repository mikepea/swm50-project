class AddUserToDish < ActiveRecord::Migration
  def self.up
    add_column :dishes, :user_id, :integer
  end

  def self.down
    remove_column :dishes, :user_id
  end
end
