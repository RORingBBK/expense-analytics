class Member < ActiveRecord::Base
	before_save { self.member_email = member_email.downcase }
	validates :member_name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :member_email, presence: true, length: { maximum: 255 },
														format: { with: VALID_EMAIL_REGEX },
														uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }
	validates :accept, acceptance: { accept: 'yes' }

	# Returns the hash digest of the given string.
	def Member.digest(string)
		cost = ActiveModel::SecurePassword.min.cost ? BCrypt::Engine::MIN_COST :
																									BCRYPT::Engine.cost
		BCRYPT::Password.create(string, cost: cost)
	end
end