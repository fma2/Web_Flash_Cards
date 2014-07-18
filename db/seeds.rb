require 'faker'

user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "123")

2.times do
	deck = Deck.create(name: Faker::Commerce.department, user_id: user.id)
	20.times do
		deck.cards << Card.create(question: Faker::Company.name, choice1: Faker::Company.catch_phrase, choice2: Faker::Company.bs, choice3: Faker::Company.bs, answer: rand(1..3))
	end
end