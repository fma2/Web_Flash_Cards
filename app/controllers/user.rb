post '/user/new' do
  user = User.create(params[:signup])
  redirect '/decks'
end

post '/user' do
  user = User.authenticate(params[:login][:email], params[:login][:password])
  if user
    session[:user_id] = user.id
    redirect to "/decks"
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

get '/decks' do
  erb :'deck/index.erb'
end


