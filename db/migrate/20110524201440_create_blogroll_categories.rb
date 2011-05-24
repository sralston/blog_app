class CreateBlogrollCategories < ActiveRecord::Migration
  def self.up
    create_table :blogroll_categories do |t|
      t.string :name, :limit => 60, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :blogroll_categories
  end
end
