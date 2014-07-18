get '/card/answer' do
  erb :'/card/answer'
end

post '/card/answer' do
  # Add logic to return string correct answer or false and store resurl
  redirect('/card/answer')
end

get '/card/question' do
  @deck = "Deck Name"
  @card = "Card"
  # Need logic to determine if there is a next question
  # Display result
  # or display next question
  erb :'card/question'
end

get '/card/new' do
  @deck = "Deck Name"
  erb :'card/new'
end

post '/deck/:id/card/new' do
  @deck = "Deck Name"
  erb :'card/new'
end
