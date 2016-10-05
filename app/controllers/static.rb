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

# byebug

@user = User.oauthenticate(params["user"]["email"],params["user"]["password"])

  erb :"static/index"

end


post '/logout' do

end