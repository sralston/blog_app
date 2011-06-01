class Tag < ActiveRecord::Base
	attr_accessible :name
	
	validates :name, :presence => true, :length => { :maximum => 30 }
	
	has_and_belongs_to_many :posts
	
	default_scope :order => 'tags.name ASC'
end
