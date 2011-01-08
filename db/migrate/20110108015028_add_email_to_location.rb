class AddEmailToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :email, :string
  end

  def self.down
    remove_column :locations, :email
  end
end
