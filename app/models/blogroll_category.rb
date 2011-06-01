class BlogrollCategory < ActiveRecord::Base
	has_many :blog_rolls
	
	default_scope :order => 'blogroll_categories.id ASC'
end
