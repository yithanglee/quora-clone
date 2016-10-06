class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers
	has_many :votes
	# has_many :user, :through => :votes 
validates :question, presence: true

end