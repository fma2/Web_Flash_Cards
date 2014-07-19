#shows all decks
get '/deck' do
  @decks = Deck.all

  erb :'deck/index'
end

#goes to create new deck form
get '/deck/new' do

  erb :'deck/new'
end

# show specific deck
get '/deck/:id' do
  @deck = Deck.find(params[:id])

  erb :'deck/deck'
end

#posts the new deck to database
post '/deck' do
  @deck = Deck.create(name: params[:name], user_id: session[:user_id])
  redirect "/deck/#{@deck.id}/card/new"
end

post '/deck/:id/round' do
  @round = Round.create(user_id: session[:user_id])
  session[:round_id] = @round.id
  @deck = Deck.find(params[:id])
  redirect "/deck/#{@deck.id}/card/#{@deck.cards.shuffle.first.id}"
end
