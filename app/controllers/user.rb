post '/user/new' do
  @user = User.create(params[:signup])
  redirect '/decks'
end

post '/user' do
  user = User.authenticate(params[:login][:email], params[:login][:password])
  if user
    session[:user_id] = user.id #params[:user_id]
    redirect to "/decks"
  else
    @errors = "couldn't log you in"
    redirect to '/'
  end
end

get '/user/logout' do
  session[:user_id] = nil
  # session.save
  session.clear
  redirect to "/"

end
get '/decks'
  erb :'deck/index.erb'
end


