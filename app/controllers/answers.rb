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

post '/questions/:question_id/answers/:answer_id/vote/up' do
# byebug
	@question = Question.find(params[:question_id])
@search = Answervote.find_by(user_id:current_user.id, answer_id:params["answer_id"])
 if  @search.nil?
 	 @vote = Answervote.new(user_id:current_user.id, answer_id:params["answer_id"], vote_type:1)
 	 @vote.save
		redirect '/questions/' + @question.id.to_s
	elsif @search.vote_type == 2
		@search.update(vote_type:1)
		redirect '/questions/' + @question.id.to_s
 	else
 		@search.destroy
 		# @search.update(vote_type:2)
		redirect '/questions/' + @question.id.to_s
# end for if
 	end
# end for post
end


post '/questions/:question_id/answers/:answer_id/vote/down' do
# byebug
	@question = Question.find(params[:question_id])
@search = Answervote.find_by(user_id:current_user.id, answer_id:params["answer_id"])
 if  @search.nil?
 	 @vote = Answervote.new(user_id:current_user.id, answer_id:params["answer_id"], vote_type:2)
 	 @vote.save
		redirect '/questions/' + @question.id.to_s
 	elsif @search.vote_type == 1
		@search.update(vote_type:2)
		redirect '/questions/' + @question.id.to_s
 	else
 		@search.destroy
 		# @search.update(vote_type:2)
		redirect '/questions/' + @question.id.to_s
# end for if
 	end
# end for post
end