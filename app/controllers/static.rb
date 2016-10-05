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