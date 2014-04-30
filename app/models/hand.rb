class Hand 

	attr_reader :cards
	
	def initialize(cards)
		@cards = cards
	end

	def name
		best_hand[:name]
	end

	def rank
		best_hand[:rank]
	end

private

	def best_hand
		@best_hand ||= calculate_best_hand
	end

	def calculate_best_hand
		return {name: "Royal Flush", rank: 9} if royal_flush? 
		return {name: "Straight Flush", rank: 8} if straight_flush? 
		return {name: "Four of a Kind", rank: 7} if four_of_a_kind? 
		return {name: "Full House", rank: 6} if full_house? 
		return {name: "Flush", rank: 5} if flush? 
		return {name: "Straight", rank: 4} if straight? 
		return {name: "Three of a Kind", rank: 3} if three_of_a_kind? 
		return {name: "Two Pair", rank: 2} if two_pair?
		return {name: "Pair", rank: 1} if pair?
		return {name: "High Card", rank: 0} 
	end

	def royal_flush? 
		["C", "S", "H", "D"].each do |suit|
			consecutive = 0
			suited_cards = cards.select {|card| card.suit == suit}
			card_values = suited_cards.map { |card| card.value }
			["A", "K", "Q", "J", "T"].each do |value|
				card_values.include?(value) ? consecutive += 1 : consecutive = 0
				return true if consecutive >= 5
			end
		end
		false
	end

	def straight_flush?
		["C", "S", "H", "D"].each do |suit|
			consecutive = 0
			suited_cards = cards.select {|card| card.suit == suit}
			card_values = suited_cards.map { |card| card.value }
			["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2", "A"].each do |value|
				card_values.include?(value) ? consecutive += 1 : consecutive = 0
				return true if consecutive >= 5
			end
		end
		false
	end

	def four_of_a_kind?
		["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2"].each do |value|
			return true if card_values.count(value) >= 4
		end
		false
	end

	def full_house?
		num_triplets = 0
		num_pairs = 0
		["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2"].each do |value|
			num_triplets += 1 if card_values.count(value) == 3
			num_pairs += 1 if card_values.count(value) == 2
		end
		return true if (num_triplets >= 1 && num_pairs >= 1)
		false
	end

	def flush?
		["C", "S", "H", "D"].each do |suit|
			return true if card_suits.count(suit) >= 5
		end
		false
	end

	def straight?
		consecutive = 0
		["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2", "A"].each do |value|
			card_values.include?(value) ? consecutive += 1 : consecutive = 0
			return true if consecutive >= 5
		end
		false
	end

	def three_of_a_kind?
		["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2"].each do |value|
			return true if card_values.count(value) == 3
		end
		false
	end 

	def two_pair?
		num_pairs = 0
		["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2"].each do |value|
			num_pairs += 1 if card_values.count(value) == 2
		end
		return true if num_pairs >= 2
		false
	end
		
	def pair?
		["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2"].each do |value|
			return true if card_values.count(value) == 2
		end
		false
	end

	def card_values
		cards.map { |card| card.value }
	end

	def card_suits
		cards.map { |card| card.suit }
	end

end