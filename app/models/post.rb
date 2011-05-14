class Post < ActiveRecord::Base
	attr_accessible :title, :subtitle, :content, :posted_by
	
	belongs_to :user, { :foreign_key => :posted_by }
	
	validates :title, :presence => true, :length => { :maximum => 120 }
	validates :subtitle, :length => { :maximum => 255 }
	
	default_scope :order => 'posts.created_at DESC'
end
