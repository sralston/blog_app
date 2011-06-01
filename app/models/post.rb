class Post < ActiveRecord::Base
	attr_accessible :title, :subtitle, :content, :posted_by
	
	belongs_to :user, { :foreign_key => :posted_by }
	has_and_belongs_to_many :tags
	
	validates :title, :presence => true, :length => { :maximum => 120 }
	validates :subtitle, :length => { :maximum => 255 }
	validates :content, :presence => true
	
	default_scope :order => 'posts.created_at DESC'
end
