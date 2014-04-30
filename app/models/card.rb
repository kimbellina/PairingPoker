class Card < ActiveRecord::Base
	belongs_to :owner, :class_name => 'User'

	def self.order_by_preference(preference)
		case preference
		when "last"
			Card.includes(:owner).order("users.last_name")
		when "first"
			Card.includes(:owner).order("users.first_name")
		else
			Card.order(:suit).reverse
		end
	end

	def self.random_unclaimed_card
		Card.where("owner_id is NULL").sample
	end
end
