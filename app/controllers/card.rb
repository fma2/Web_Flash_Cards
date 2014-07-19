# CREATE NEW CARD
get '/deck/:deck_id/card/new' do
  @deck = Deck.find(params[:deck_id])
  erb :'card/new'
end

post '/deck/:deck_id/card' do
  @deck = Deck.find(params[:deck_id])
  @deck.cards << Card.create(params[:card])
  redirect "/deck/#{@deck.id}/card/new"
end

# GET/POST ANSWERS
get '/deck/:deck_id/card/:card_id/answer/:correct' do
  @card = Card.find(params[:card_id])
  @deck = @card.deck
  @correct = params[:correct]
  # @correct = params[:correct]
  erb :'/card/answer'
end

post '/deck/:deck_id/card/:card_id/answer' do
  # Add logic to return string correct answer or false and store result
  @card = Card.find(params[:card_id])
  @correct = @params[:card][:choice] == @card.answer
  session[:round_id]
  Guess.create(round_id: session[:round_id], card_id: params[:card_id], correct: @correct)
  redirect("/deck/#{@card.deck_id}/card/#{@card.id}/answer/#{@correct}")
end

# GO TO NEXT CARD
get '/deck/:deck_id/card/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])

  @choices = []
  @choices << @card.choice1 << @card.choice2 << @card.choice3 << @card.answer
  @choices.shuffle!
  erb :'card/question'
end
