get '/' do
  erb :index
end

after do
	ActiveRecord::Base.connection.close
end

