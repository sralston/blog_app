class Tag < ActiveRecord::Base
	attr_accessible :name
	
	validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 30 }
	
	has_and_belongs_to_many :posts
	
	default_scope :order => 'tags.name ASC'
	
	def self.tags_count
		find(:all, :select => 'tags.id, tags.name, COUNT(posts_tags.tag_id) as tag_count',
			 :joins => 'INNER JOIN posts_tags ON posts_tags.tag_id = tags.id',
			 :group => 'tags.name')
	end

end
