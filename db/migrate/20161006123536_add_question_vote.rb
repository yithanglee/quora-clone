class AddQuestionVote < ActiveRecord::Migration
	def change
		create_table :votes do |t|
			t.belongs_to :user
			t.belongs_to :question
			t.integer :vote_count
				t.timestamps null:false
			end
	end
end
