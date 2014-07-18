#shows all decks
get '/decks' do
  @decks = Deck.all

  erb :'deck/index'
end

# show specific deck
get '/deck/:id' do
  @deck = Deck.find(params[:id])

  erb :'deck/deck'
end

#goes to create new deck form
get '/deck/new' do

  erb :'deck/new'
end

#posts the new deck to database
post '/deck' do
  @deck = Deck.create(params[:deck])
  redirect '/'
end


