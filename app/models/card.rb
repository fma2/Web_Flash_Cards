class Card < ActiveRecord::Base
	has_many :guesses
	has_many :rounds, through: :guesses
	belongs_to :deck

	validates :question, :choice1, :choice2, :choice3, :answer, presence: true
  # Remember to create a migration!
end
