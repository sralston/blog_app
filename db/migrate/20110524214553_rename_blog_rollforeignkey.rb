class RenameBlogRollforeignkey < ActiveRecord::Migration
  def self.up
  	rename_column :blog_rolls, :blogroll_categories_id, :blogroll_category_id
  end

  def self.down
  	rename_column :blog_rolls, :blogroll_category_id, :blogroll_categories_id
  end
end
