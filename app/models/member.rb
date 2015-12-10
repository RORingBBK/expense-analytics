class Member < ActiveRecord::Base
	attr_accessor :remember_token
	before_save { self.member_email = member_email.downcase }
	validates :member_name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :member_email, presence: true, length: { maximum: 255 },
														format: { with: VALID_EMAIL_REGEX },
														uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }
	validates :accept, acceptance: { accept: 'yes' }
	validates :member_country, presence: true

	# Returns the hash digest of the given string.
	def Member.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
																									BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	# Returns a Random Token.
	def Member.new_token
		SecureRandom.urlsafe_base64
	end

	# Remembers a user in the database for use in persistent sessions.
	def remember
		self.remember_token = Member.new_token
		update_attribute(:remember_digest, Member.digest(remember_token))
	end

	# Returns true if token matches  the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	# Forgets a user.
	def forget
		update_attribute(:remember_digest, nil)
	end

	# def country_name
	# 	country = ISO3166::Country[country_code]
	# 	country.translations[I18n.locale.to_s] || country.name
	# end
end