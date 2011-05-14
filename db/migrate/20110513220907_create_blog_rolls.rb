class CreateBlogRolls < ActiveRecord::Migration
  def self.up
    create_table :blog_rolls do |t|
      t.string :url
      t.string :title
      t.string :icon_filename, :limit => 120
      t.string :description
      t.float :rating, :precision => 2, :scale => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :blog_rolls
  end
end
