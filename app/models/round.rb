class Round < ActiveRecord::Base
	belongs_to :user
	has_many :guesses
	has_many :cards, through: :guesses
  # Remember to create a migration!
end
