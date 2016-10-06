post '/login' do

	@user_login = User.oauthenticate(params["user"]["email"],params["user"]["password"])
	if @user_login == "success!"
	@user_login = User.find_by(email: params["user"]["email"])
	session[:user_id] = @user_login.id
	redirect '/homepage'
	else
	@user_login
	return @current_user.to_json
  erb :"static/index"
	end
end

post '/logout' do

	session[:user_id] = nil
	redirect '/'
end