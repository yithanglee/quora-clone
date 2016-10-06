get '/questions' do
	@list_question = current_user.questions
	if current_user.answers.blank?
		@list_answers = []
	else
	@list_answers = current_user.answers
end
	erb :"questions/index"
end

get '/questions/:question_id' do

	@current_question = Question.find(params[:question_id])
	erb :"questions/show"
end

post '/questions' do
	@question = Question.new(user_id:current_user.id, question:params["abc"][":question"])

	if @question.save
	 redirect '/homepage'
	else
	# end for if
	
	end
	# end for post question
end

delete '/questions/:question_id' do
	
	@question = Question.find(params[:question_id])
	@question.destroy
	redirect '/questions'
	#end for delete
end

patch '/questions/:question_id' do
	@question = Question.find(params[:question_id])
		if current_user.id == Question.find(params[:question_id]).user.id
			@question.update(question: params["abc"][":question"])
		redirect "/questions/#{@question.id}"
	else
@msg = "cant update"
		flash[:notice] = "you cant update this"
	# erb :"questions/question"
		redirect "/questions/#{@question.id}"
		end
	#end for patch
	end


post '/questions/:question_id/vote' do
 @search = Vote.find_by(user_id:current_user.id, question_id:params["question_id"])
 	 if  @search.nil?
 	 	  @vote = Vote.new(user_id:current_user.id, question_id:params["question_id"], vote_type:1)
 	 	 @vote.save
 	 else
 	  @search.destroy
 	  # return @vote.to_json
 	 # end for if
 	 end 
 	 x = Vote.where(question_id:params["question_id"])
 	 	 	return x.to_json
# end for post
end

