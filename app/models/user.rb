class User < ActiveRecord::Base
	attr_accessible :username, :email, :first_name, :last_name, :password, :password_confirmation
	attr_accessor :password

	has_many :posts, { :foreign_key => "posted_by" }
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i	
	
	validates :username, :presence => true, :length => { :maximum => 40 }
	validates :email, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
	validates :password, :presence => true, :confirmation => true, :length => { :within => 6..40 }

	before_save :encrypt_password
	
	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end
	
	def self.authenticate(username, submitted_password)
		user = find_by_username(username)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end
	
	def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
	end
	
	private
	
		def encrypt_password
			self.salt = make_salt if new_record?
			self.encrypted_password = encrypt(password)
		end
		
		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end
		
		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end
		
		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end
end
