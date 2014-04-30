# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Creating the Cards"
values = ["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2"]
suits = ["C", "S", "H", "D"]
values.each do |value| 
	suits.each do |suit| 
		Card.create(value: value, suit: suit, image: "#{value}#{suit}.png")
	end
end

players = [
	{ first_name: "Ken", last_name: "Rodemann" },
        { first_name: "Brian", last_name: "Olore" },
        { first_name: "Eric", last_name: "Stolten" },
        { first_name: "Vishal", last_name: "Chandnani" },
        { first_name: "Dave", last_name: "Kristol" },
        { first_name: "Larry", last_name: "Ruedisueli" },
        { first_name: "Frank", last_name: "Visaggio" },
        { first_name: "Marty", last_name: "Hoffner" },
        { first_name: "Sean", last_name: "McAuliffe" },
        { first_name: "Jenn", last_name: "Dodd" },
        { first_name: "Jay", last_name: "Alejandro" },
        { first_name: "Tom", last_name: "Johnson" },
        { first_name: "Mahe", last_name: "Krishnan" },
        { first_name: "Matt", last_name: "Curry" },
        { first_name: "Ryan", last_name: "Bowman" },
        { first_name: "Keith", last_name: "Bingaman" },
        { first_name: "Kim", last_name: "Johnson" },
        { first_name: "Cathy", last_name: "Lohman" },
        { first_name: "Ray", last_name: "Carbone" },
        { first_name: "Jess", last_name: "Hottenstein" },
        { first_name: "Mark", last_name: "DeLillo" },
        { first_name: "Rob", last_name: "McNevin" },
        { first_name: "Steve", last_name: "Starr" },
        { first_name: "Scott", last_name: "Kolb" },
        { first_name: "Dan", last_name: "O'Connell" },
        { first_name: "Ariel", last_name: "Valentin" },
        { first_name: "Ryan", last_name: "Marone" },
	{ first_name: "Nancy", last_name: "Mintz" },
        { first_name: "Rob", last_name: "Dunne" },
        { first_name: "Sean", last_name: "Edge" },
        { first_name: "Nick", last_name: "Ciaccio" },
        { first_name: "Mark", last_name: "Ginalski" },
        { first_name: "Yogi", last_name: "Saxena" },
        { first_name: "Karl", last_name: "Schwab" },
        { first_name: "Diana", last_name: "O'Connell" },
        { first_name: "Larry", last_name: "Auton" },
        { first_name: "Dave", last_name: "Slovak" },
        { first_name: "Irene", last_name: "Grimaldi" },
        { first_name: "Jimmy", last_name: "Park" },
        { first_name: "Srini", last_name: "Karri" },
        { first_name: "Roger", last_name: "Wu" },
        { first_name: "Roy", last_name: "Roque" },
        { first_name: "Greg", last_name: "Crawford" },
        { first_name: "Bobby", last_name: "D" },
        { first_name: "Abe", last_name: "Sancher" },
        { first_name: "Ann", last_name: "Wang" },
        { first_name: "Peter", last_name: "Lin" },
        { first_name: "Dave", last_name: "Weimer" }]

puts "Creating the Users"
players.each do |player_hash|
	first = player_hash[:first_name]
	last = player_hash[:last_name]
	user = User.create(first_name: first, 
				last_name: last, 
				email: "#{first}.#{last}@chubtoad.com", 
				password: "Hello!23", 
				password_confirmation: "Hello!23")
	card = Card.random_unclaimed_card
	card.owner_id = user.id
	card.save
end

puts "Creating the Partnerships"
User.all.each do | user |
	rand(2..10).times do 
		partner = User.all.sample 
		partnership = Partnership.create(user: user, partner: partner, message: "#{user.first_name} paired with #{partner.first_name}" )
	end
end



