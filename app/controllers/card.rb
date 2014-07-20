# CREATE NEW CARD
get '/deck/:deck_id/card/new' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  erb :'card/new'
end

post '/deck/:deck_id/card' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  @card = Card.create(params[:card])
  if @card.save
    @cards << @card
    erb :'card/_question', :layout => false
  else
    if @card
      erb :model_errors, :locals => { :model => @card }, :layout => false
    end
  end
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
  content_type :json
  @card = Card.find(params[:card_id])
    if params[:card][:choice] == @card.answer
      @correct = true
      @color = "green"
    else
      @correct = false
      @color = "red"
      print "false"
    end
  Guess.create(round_id: session[:round_id], card_id: params[:card_id], correct: @correct)
  {correct: @correct, color: @color}.to_json
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
