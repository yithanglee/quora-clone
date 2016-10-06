class AddAnswerVote < ActiveRecord::Migration
	def change
		create_table :answervotes do |t|
			t.belongs_to :user
			t.belongs_to :answer
				t.integer :vote_count
				t.integer :vote_type
				t.timestamps null:false
			end

			add_column :votes, :vote_type, :integer
	end

end
