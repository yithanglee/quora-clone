class User < ActiveRecord::Base
	has_many :questions
	has_many :answers

	has_secure_password validations: false

validates :name, uniqueness: true, presence: true
validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, presence: true


	def self.oauthenticate(oemail, opassword)

a = self.find_by(email: oemail)
if a.blank? == false
		if oemail == a.email
			if self.find_by(email: oemail).try(:authenticate, opassword)
				return "success!"
			else
				return "wrong password!"
			# end for if authenticate
			end
		else
			return "no such combination for email and password!"
		# end for if email == self
		end
	else
		return "email not found!"
#end for blank and not found
	end
# end for authenticate method
	end
# end for class
end