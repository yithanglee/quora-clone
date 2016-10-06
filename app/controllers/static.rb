get '/' do
  erb :"static/index"
end

get '/homepage' do
	# byebug
	@questions = Question.all
	erb :"static/homepage"
end