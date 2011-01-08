class AddWebsiteToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :website, :string
  end

  def self.down
    remove_column :locations, :website
  end
end
