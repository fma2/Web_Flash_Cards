get '/deck/:deck_id/card/:card_id/answer/:correct' do
  @card = Card.find(params[:card_id])
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

get '/deck/:deck_id/card/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])

  @choices = []
  @choices << @card.choice1 << @card.choice2 << @card.choice3 << @card.answer
  @choices.shuffle!
  # Need logic to determine if there is a next question
  # Display result
  # or display next question
  erb :'card/question'
end

get '/card/new' do
  @deck = "Deck Name"
  erb :'card/new'
end

post '/card/new' do
  @deck = "Deck Name"
  erb :'card/new'
end
