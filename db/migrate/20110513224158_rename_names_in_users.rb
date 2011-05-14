class RenameNamesInUsers < ActiveRecord::Migration
  def self.up
  	rename_column :users, 'first', 'first_name'
  	rename_column :users, 'last', 'last_name'
  end

  def self.down
  end
end
