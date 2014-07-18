post '/user/new' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect '/deck'
end

post '/user' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect to "/deck"
  else
    @errors = "couldn't log you in"
    redirect '/'
  end
end

get '/user/logout' do
  session[:user_id] = nil
  # session.clear
  redirect "/"
end



