class User < ActiveRecord::Base
	# Changes email to downcase before saving
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	# Each user may have many events
	has_many :events
	attr_accessible :firstname, :lastname, :email, :password, :password_confirmation
	validates :firstname, presence: true
	validates :lastname, presence: true
	# Email Regex
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	# Email is required and unique
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	# Ensures password and confirm password are correct and converts to secure password
	has_secure_password
	validates :password, length: { minimum: 6 }
	
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

	def create_remember_token
	  self.remember_token = User.encrypt(User.new_remember_token)
	end
end
