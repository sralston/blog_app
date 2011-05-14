class User < ActiveRecord::Base

	has_many :posts, { :foreign_key => "posted_by" }
end
