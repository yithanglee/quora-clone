get '/' do
  erb :"static/index"
end

post '/signup' do
	@user = User.new(params[:user])
	# byebug

	if @user.save
		redirect '/'
	else
		@errors = @user.errors.full_messages
  erb :"static/index"
	# end for if
	end
	# end for post
end

post '/login' do

	@user_login = User.oauthenticate(params["user"]["email"],params["user"]["password"])
	if @user_login == "success!"
	@user_login = User.find_by(email: params["user"]["email"])
	session[:user_id] = @user_login.id
	redirect '/homepage'
	else
	@user_login
  erb :"static/index"
	end
end

get '/homepage' do
	@questions = Question.all

	erb :"static/homepage"
end

post '/logout' do

	session[:user_id] = nil
	redirect '/'
end

get '/users/:id/edit' do
	erb :"static/user_profile"
end

get '/questions' do
	
	@list_question = current_user.questions
	erb :"questions/index"
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
	byebug
	@question = Question.find(params[:question_id])
	@question.destroy
	redirect '/questions'
	#end for delete
end

patch '/questions/:question_id' do
	@question = Question.find_by(params[:question_id])
	@question.update(params[:question])
	#end for patch
end