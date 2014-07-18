class User < ActiveRecord::Base
	has_many :rounds
	has_many :decks
  # Remember to create a migration!
end
