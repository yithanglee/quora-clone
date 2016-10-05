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

@user = User.oauthenticate(params["user"]["email"],params["user"]["password"])
user = User.find_by(email: params["user"]["email"])
session[:user_id] = user.id
redirect '/homepage'


end

get '/homepage' do

erb :"static/homepage"

end


post '/logout' do

end