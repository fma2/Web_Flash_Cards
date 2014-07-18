helpers do 	
	def percentage(correct, num_cards)
		percentage = (correct.to_f / num_cards.to_f) * 100
		percent_string = (percentage.to_i).to_s + "%"
	end
end