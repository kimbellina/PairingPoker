class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :partnerships  
  has_many :partners, :through => :partnerships
  #has_many :cards, :though => :partnerships

  def leading_card
  	Card.find_by(owner_id: id )
  end

  def card_count
  	collected_cards.count
  end

  def collected_cards
  	collected_cards = []
  	collected_cards << leading_card
  	Partnership.where(user_id: id).each do |partnership|
      card = Card.find_by(owner_id: partnership.partner_id)
  		(collected_cards << card) if card
  	end
  	Partnership.where(partner_id: id).each do |partnership|
      card = Card.find_by(owner_id: partnership.user_id)
  		(collected_cards << card) if card
  	end
  	collected_cards.uniq
  end

end
