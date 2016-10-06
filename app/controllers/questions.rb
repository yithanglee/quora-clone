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
	erb :"questions/question"
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