class AddBlogrollCategoriesForeignKeyToBlogRoll < ActiveRecord::Migration
  def self.up
  	add_column :blog_rolls, :blogroll_categories_id, :integer
  end

  def self.down
  	remove_column :blog_rolls, :blogroll_categories_id
  end
end
