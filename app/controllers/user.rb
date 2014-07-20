post '/user/new' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/deck'
  else
    erb :index
  end
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

get '/user/results' do
  @user = User.find(session[:user_id])
  @rounds = Round.where(user_id: @user.id)
  session[:round_id] = nil
  erb :history
end


