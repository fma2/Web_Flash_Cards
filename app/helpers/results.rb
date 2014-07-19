helpers do
	def percentage(correct, num_cards)
    if num_cards == 0 && correct == 0
      "0%"
    else
      percentage = (correct.to_f / num_cards.to_f) * 100
      percent_string = (percentage.to_i).to_s + "%"
    end
	end
end
