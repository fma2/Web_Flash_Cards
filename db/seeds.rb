require 'faker'

def load_flashcards(txt)
	all_flashcards =[]
	File.open(txt).readlines.each do |row|
		all_flashcards << row.chomp
	end
	cards = []
	all_flashcards.each_slice(2) { |pair| cards << pair }
	cards
end

us_capitals = load_flashcards('db/fixtures/us-capitals.txt')
world_capitals = load_flashcards('db/fixtures/world-capitals.txt')
ruby_terms = load_flashcards('db/fixtures/ruby-terms.txt')
dbc_students = load_flashcards('db/fixtures/students-cohorts.txt')

user1 = User.create(name: "Farheen", email: "f@gmail.com", password: "cake")
user2 = User.create(name: "David", email: "d@gmail.com", password: "cake")
user3 = User.create(name: "Stella", email: "s@gmail.com", password: "cake")

deck1 = Deck.create(name: "US Capitals", user_id: user1.id)
us_capitals.each_with_index do |x, index|
	capitals1 = ["Montgomery", "Juneau", "Phoenix", "Little Rock", "Sacramento", "Denver", "Hartford", "Dover", "Tallahassee", "Atlanta", "Honolulu", "Boise", "Springfield", "Indianapolis", "Des Moines", "Topeka", "Frankfort", "Baton Rouge", "Augusta", "Annapolis", "Boston", "Lansing", "Saint Paul", "Jackson", "Jefferson City", "Helena", "Lincoln", "Carson City", "Concord", "Trenton", "Santa Fe", "Albany", "Raleigh", "Bismarck", "Columbus", "Oklahoma City", "Salem", "Harrisburg", "Providence", "Columbia", "Pierre", "Nashville", "Austin", "Salt Lake City", "Montpelier", "Richmond", "Olympia", "Charleston", "Madison", "Cheyenne"]
	deck1.cards << Card.create(question: x[0], choice1: capitals1.sample, choice2: capitals1.sample, choice3: capitals1.sample, answer: x[1])
end

deck2 = Deck.create(name: "World Capitals",user_id: user2.id)
world_capitals.each_with_index do |x, index|
	capitals2 = ["Kabul", "Tirana", "Algiers", "Andorra la Vella", "Luanda", "St. John's", "Buenos Aires", "Yerevan", "Canberra", "Vienna", "Baku", "Nassau", "Manama", "Dhaka", "Bridgetown", "Minsk", "Brussels", "Belmopan", "Porto-Novo", "Thimphu", "Sucre (constitutional, judicial), La Paz (administrative)", "Sarajevo", "Gaborone", "Brasília", "Bandar Seri Begawan", "Sofia", "Ouagadougou", "Bujumbura", "Phnom Penh", "Yaoundé", "Ottawa", "Praia", "Bangui", "N'Djamena", "Santiago (official), Valparaíso­so (legislative)", "Beijing", "Bogotá", "Moroni", "Brazzaville", "Kinshasa", "Sant José", "Yamoussoukro (official), Abidjan (administrative)", "Zagreb", "Havana", "Nicosia", "Prague", "Copenhagen", "Djibouti", "Roseau", "Santo Domingo", "Dili", "Quito", "Cairo", "San Salvador", "Malabo", "Asmara", "Tallinn", "Addis Ababa", "Suva", "Helsinki", "Paris", "Libreville", "Banjul", "Tbilisi", "Berlin", "Accra", "Athens", "St. George's", "Guatemala City", "Conakry", "Bissau", "Georgetown", "Port-au-Prince", "Vatican City", "Tegucigalpa", "Budapest", "Reykjavík", "New Delhi", "Jakarta", "Tehran", "Baghdad", "Dublin", "Jerusalem", "Rome", "Kingston", "Tokyo", "Amman", "Astana", "Nairobi", "Tarawa", "Pyongyang", "Seoul", "Kuwait City", "Bishkek", "Vientiane", "Riga", "Beirut", "Maseru", "Monrovia", "Tripoli", "Vaduz", "Vilnius", "Luxembourg", "Skopje", "Antananarivo", "Lilongwe", "Kuala Lumpur (official), Putrajaya (administrative)", "Malé", "Bamako", "Valletta", "Majuro", "Nouakchott", "Port Louis", "Mexico City", "Palikir", "Chișinău", "Monaco", "Ulaanbaatar", "Podgorica", "Rabat", "Maputo", "Naypyidaw", "Windhoek", "None (Government offices in Yaren District)", "Kathmandu", "Amsterdam (official), The Hague (administrative, legislative, and judicial)", "Wellington", "Managua", "Niamey", "Abuja", "Oslo", "Muscat", "Islamabad", "Melekeok", "Panama City", "Port Moresby", "Asunción", "Lima", "Manila", "Warsaw", "Lisbon", "Doha", "Bucharest", "Moscow", "Kigali", "Basseterre", "Castries", "Kingstown", "Apia", "San Marino", "São Tomé", "Riyadh", "Edinburgh", "Dakar", "Belgrade", "Victoria", "Freetown", "Singapore", "Bratislava", "Ljubljana", "Honiara", "Mogadishu", "Pretoria (official and administrative), Cape Town (legislative), Bloemfontein (judicial)", "Madrid", "Colombo (official), Sri Jayewardenepura Kotte (legislative)", "Khartoum", "Paramaribo", "Mbabane (official, administrative), Lobamba (royal and legislative)", "Stockholm", "Bern", "Damascus", "Taipei", "Dushanbe", "Dodoma (official), Dar es Salaam (administrative)", "Bangkok", "Lomé", "Nuku'alofa", "Port of Spain", "Tunis", "Ankara", "Ashgabat", "Funafuti", "Kampala", "Kiev", "Abu Dhabi", "London", "Washington, D.C.", "Montevideo", "Tashkent", "Port Vila", "Caracas", "Hanoi", "Cardiff / Caerdydd", "Sanaa", "Lusaka", "Harare", "Pago Pago", "The Valley", "Oranjestad", "Georgetown", "Ponta Delgada", "Hamilton", "Las Palmas/Santa Cruz", "George Town", "The Settlement", "West Island", "Avarua", "Stanley", "Tórshavn", "Cayenne", "Papeete", "Gibraltar", "Nuuk", "Hagatna", "St Peter Port", "Saint Helier", "Douglas", "Funchal", "Fort-de-France", "Mamoudzou", "Plymouth", "Willemstad", "Nouméa", "Alofi", "Kingston", "Saipan", "Adamstown", "San Juan", "Saint-Denis", "Jamestown", "Saint-Pierre", "none", "Cockburn Town", "Road Town", "Charlotte Amalie", "Mata-Utu", "Sukhumi", "Vitoria-Gasteiz", "Grozny", "Arbil", "Priština", "Stepanakert", "Ramallah and Gaza (East Jerusalem desired)", "Jerusalem", "Garoowe", "Hargeisa", "Tskhinvali", "Tiraspol", "Kilinochchi"]
	deck2.cards << Card.create(question: x[0], choice1: capitals2.sample, choice2: capitals2.sample, choice3: capitals2.sample, answer: x[1])
end

deck3 = Deck.create(name: "Ruby Terms", user_id: user3.id)
ruby_terms.each_with_index do |x, index|
	terms = ["alias", "and", "BEGIN", "begin", "break", "case", "class", "def", "defined?", "do", "else", "elsif", "END", "end", "ensure", "false", "for", "if", "in", "module", "next", "nil", "not", "or", "redo", "rescue", "retry", "return", "self", "super", "then", "true", "undef", "unless", "until", "when", "while", "yield"]
	deck3.cards << Card.create(question: x[0], choice1: x[1], choice2: terms.sample, choice3: terms.sample, answer: x[1])
end


deck4 = Deck.create(name: "DBC Student-Cohort", user_id: user1.id)
dbc_students.each_with_index do |x, index|
	cohorts = %w(Crab Peeper Cicada Woodchuck Caterpillar Nighthawk Admiral Dragonfly Grasshopper Gopher Skipper)
	deck4.cards << Card.create(question: x[0], choice1: cohorts.sample, choice2: cohorts.sample, choice3: cohorts.sample, answer: x[1])
end
