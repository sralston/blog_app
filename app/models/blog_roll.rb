class BlogRoll < ActiveRecord::Base
	attr_accessible :url, :title, :icon_filename, :description, :rating, :blogroll_category_id

	belongs_to :blogroll_categories
	
	validates :url, :presence => true, :length => { :maximum => 255 } 
	validates :title, :presence => true, :length => { :maximum => 255 }
end
