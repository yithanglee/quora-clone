class CreateTables < ActiveRecord::Migration

	def change

	create_table :users do |t|

	t.string :name
	t.string :email
	t.string :password
	t.timestamps null:false
		end

	create_table :questions do |t|

	t.belongs_to :user
	t.string :question
	t.timestamps null:false
		end


	create_table :answers do |t|

	t.belongs_to :question
	t.belongs_to :user
	t.string :answer
	t.timestamps null:false
		end


	end

end