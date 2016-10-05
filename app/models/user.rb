class User < ActiveRecord::Base
	has_many :questions
	has_many :answers

	has_secure_password validations: false

validates :name, uniqueness: true, presence: true
validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, presence: true


end