class CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
	def index
		@preference = params[:preference]
    	@cards = Card.order_by_preference(@preference)
    	@best_hand = Hand.new(current_user.collected_cards)
	end

end