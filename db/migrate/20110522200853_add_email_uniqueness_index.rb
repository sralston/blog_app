class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
  	add_index :users, :email, :unique => true
  	change_column :users, :access_level, :string, :limit => 20
  end

  def self.down
  	remove_index :users, :email
  end
end
