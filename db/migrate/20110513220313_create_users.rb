class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username, :limit => 40, :null => false
      t.string :email, :limit => 120
      t.string :access_level, :default=>"READ"
      t.string :first, :limit => 40
      t.string :last, :limit => 40

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
