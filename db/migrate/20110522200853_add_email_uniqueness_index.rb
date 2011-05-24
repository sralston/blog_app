class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
  	add_index :users, :email, :unique => true
  	change_column :users, :access_level, :string, :limit => 20
  end

  def self.down
  	change_column :users, :access_level, :limit => 255
  	remove_index :users, :email
  end
end
