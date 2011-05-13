class Post < ActiveRecord::Base
	attr_accessible :title, :subtitle, :content, :posted_by, :tags
	
	validates :title, :presence => true, :length => { :maximum => 200 }
	validates :content, :presence => true, :length => { :maximum => 512 }
end
