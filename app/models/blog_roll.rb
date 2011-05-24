class BlogRoll < ActiveRecord::Base
	attr_accessible :url, :title, :icon_filename, :description, :rating

	belongs_to :blogroll_categories
end
