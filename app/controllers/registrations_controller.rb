# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

	def create
    	super do |new_user|
    		random_card = Card.random_unclaimed_card
    		random_card.owner_id = new_user.id
    		random_card.save
    	end
	end

end 