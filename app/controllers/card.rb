post '/deck/:id/card/:id' do #BUGBUG
end

get '/deck/:id/card/:id' do #BUGBUG
end

get '/deck/:id/card/:id/answer' do #BUGBUG
end


get '/card/new' do #BUGBUG
  @deck = "hello"

  erb :'card/card_new'
end
