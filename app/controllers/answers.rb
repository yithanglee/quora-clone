post '/questions/:question_id/answers/' do
	
	@question = Question.find(params[:question_id])
	@answer_new = Answer.new(question_id: params["question_id"].to_i, user_id: current_user.id, answer: params["user"][":answer"])
	@answer_new.save
		redirect '/questions/' + @question.id.to_s
end

delete '/questions/:question_id/answers/:answer_id' do
	@answer = Answer.find(params[:answer_id])
	@answer.destroy
	redirect '/questions'
	#end for delete
end