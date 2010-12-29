class CreateUserRights < ActiveRecord::Migration
  def self.up
    create_table :user_rights do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :user_rights
  end
end
