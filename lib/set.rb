# Main Set Project Ruby File
# Esther Hu
# Nick Springer
# Zehur Elmi
# Evan Hubert

#function called when outputting message to players
def prompt(message)
    puts message
    gets.chomp!()
end

#card class and initializer
class Card
	attr_accessor :color, :symbol, :shading, :amount

	#attributes of each card
	def initialize(color, symbol, shading, amount)
		@color = color
		@symbol = symbol
		@shading = shading
		@amount = amount
    end

	def equals(other)
		@amount == other.amount && @color == other.color && @shading == other.shading && @symbol == other.symbol
	end

	#displays cards as a  string
	def to_string
		colors = ["purple", "green", "red"]
		symbols = ["oval", "diamond", "squiggly"]
		shadings = ["striped", "solid", "empty"]
		"#{colors[@color]} #{symbols[@symbol]} #{shadings[@shading]} #{@amount}"
    end
end

#player class and initializer
class Player
	attr_accessor :name, :score, :win_count

	#attributes of each player
	def initialize(name)
		@name = name
		@score = 0
		@win_count = 0
	end
end

=begin
Generates 81 card deck to be added to cards_available array.
updates:
	cards_available
=end
def generate_deck(cards_available)
	for color in 0...3
		for symbol in 0...3
			for shading in 0...3
				for amount in 1...4
					cards_available.push(Card.new color, symbol, shading, amount)
				end
			end
		end
	end
end

=begin
Adds a card from the cards_available deck to the cards_displayed desk.
Removes card from cards_available.
updates:
	cards_available
	cards_displayed
=end
def add_random_card_available_displayed(cards_available, cards_displayed)
	if cards_available.length == 0 
		return
	end

	#chooses a random index for card choice
	random_card_index = rand 0...cards_available.length
	#removes chosen card from cards_available
	random_card = cards_available.delete_at random_card_index

	#adds chosen card to be displayed to players
    cards_displayed.push random_card
end

=begin
Adds a certain amount of random cards with numCards being the number of cards to add.
=end
def add_random_available_cards_to_displayed(cards_available, cards_displayed, numCards)
	for i in 0...numCards
		add_random_card_available_displayed(cards_available, cards_displayed)
	end
end

=begin
It takes in 3 cards and adds them to cardsUsed. It removes the cards from cardsDisplayed
updates:
	cardsUsed
	cardsDisplayed
=end
def add_three_displayed_cards_to_used(cards_displayed, cards_used, card_one, card_two, card_three)
	#removes three given cards from cardsDisplayed
	cards_displayed.filter! {|card| !(card.equals(card_one) || card.equals(card_two) || card.equals(card_three))}

	#adds the three cards to cardsUsed
	cards_used.push(card_one, card_two, card_three)
end

=begin
It adds all card objects from cards_used and cards_displayed into cards_available. 
It resets cards_displayed and cards_used
updates:
	cards_available
clears:
	cards_used
	cards_displayed
=end
def shuffle_deck(cards_available, cards_displayed, cards_used)
	cards_available.push *cards_used
	cards_available.push *cards_displayed

    cards_displayed.filter! {|card| false}
    cards_used.filter! {|card| false}
end

=begin
Takes in 3 card objects and checks if they are a set.
Returns a boolean true if set and false if not set.
=end
def is_set(card_one, card_two, card_three)

	#checks if all cards share any attribute
	all_same_number = card_one.amount == card_two.amount && card_two.amount == card_three.amount
	all_same_color = card_one.color == card_two.color && card_two.color == card_three.color
	all_same_shading = card_one.shading == card_two.shading && card_two.shading == card_three.shading
	all_same_symbol = card_one.symbol == card_two.symbol && card_two.symbol == card_three.symbol

	#checks if all cards share no attributes
	all_different_number = card_one.amount != card_two.amount && card_two.amount != card_three.amount
	all_different_color = card_one.color != card_two.color && card_two.color != card_three.color
	all_different_shading = card_one.shading != card_two.shading && card_two.shading != card_three.shading
	all_different_symbol = card_one.symbol != card_two.symbol && card_two.symbol != card_three.symbol

	#determines if cards are a set by checking if all attributes are either different or the same
	all_different_or_same_number = all_same_number || all_different_number
	all_different_or_same_color = all_same_color || all_different_color
	all_different_or_same_shading = all_same_shading || all_different_shading
	all_different_or_same_symbol = all_same_symbol || all_different_symbol

	#final boolean determining if cards are a set
	all_different_or_same_number && all_different_or_same_color && all_different_or_same_shading && all_different_or_same_symbol
end

=begin
Displays cards to players and asks them to find a set. Various functions handle different situations. 
updates:
	cards_available
	cards_displayed
=end
def play_set(cards_available, cards_displayed, cards_used, players)
	puts "Starting a new game!"

	#reshuffle the deck
	shuffle_deck(cards_available, cards_displayed, cards_used)

	# Put twleve cards into the displayed by default
	add_random_available_cards_to_displayed(cards_available, cards_displayed, 12)

	#display cards as long as there are at least 3
	while cards_displayed.length >= 3 do
		input_string = "Which are sets? Enter player name and card indexes separated by a space. Enter blank if set not found. (#{cards_available.length} cards left in available deck) #{cards_displayed.enum_for(:each_with_index).map{|card, i| "\n#{i + 1}: #{card.to_string()}"}.join("")}"

		input = prompt(input_string)

		#if user enters an empty space, it means they cannot find a set
		if input == "quit"
			quit = prompt("Are you sure you want to quit? ")
			#allow players to end game
			if quit == "yes" || quit == "y"
				return
        	end
		elsif input != ""
			#take user input and divide into names and card indices 
			tokens = input.split(" ")			
			player_name = tokens[0]

			tokens.delete_at(0)
			#if not a valid int input change n to 0 so not in range of 1-12
			numbers = tokens.map {|n| Integer(n) rescue 0} 
			#check if user inserted valid input. i.e. valid card number or existing player name
			while tokens.length != 3 || numbers.any? {|num| !(num.between?(1,12))} || !(players.any? {|p| p.name == player_name }) do
				if !(players.any? {|p| p.name == player_name })
					puts("Player not found, please try again\n")
				else
					puts("Invalid card number, please try again\n")
				end

				input = prompt(input_string)
				tokens = input.split(" ")
				player_name = tokens[0]
				tokens.delete_at(0)
				numbers = tokens.map {|n| Integer(n) rescue 0}
			end

			#array for cards chosen by player
			cards = []

			#add chosen cards from cardsDisplayed to cards array
			for i in 1..cards_displayed.length
				if numbers.include?(i)
					cards.push(cards_displayed[i - 1])
				end
			end

			#check if the cards chosen by player are a set. Keep track of which player chose the cards
			if is_set(cards[0], cards[1], cards[2])
				player = players.find {|p| p.name == player_name}

				#update the player's score tally if they have chosen a set correctly
				player.score += 1
				puts "\nThis is a set! #{player.name} has scored #{player.score} times!"

				#refill the array to make sure 12 cards are displayed to players again
				if cards_displayed.length > 12
					add_three_displayed_cards_to_used(cards_displayed, cards_used, cards[0], cards[1], cards[2])
				else
					add_three_displayed_cards_to_used(cards_displayed, cards_used, cards[0], cards[1], cards[2])
					add_random_available_cards_to_displayed(cards_available, cards_displayed, 3)
				end
			else
				puts "\nNot a set, try again"
			end
		else
			#if user cannot find a set, add 3 more cards
			if cards_available.length >= 3
				puts "\nOkay...here's some more"
				add_random_available_cards_to_displayed(cards_available, cards_displayed, 3)
			else
				#gives user more cards if there are less than 3 left
				puts "\nNo more left, use these cards!"
            end
		end
	end

	#calculate the winner of the game by tracking points
	winner = players.reduce {|most_points, current_points| current_points.score > most_points.score ? current_points : most_points }

	#keep track of number of times each player has won
	winner.win_count += 1
	puts "Game over... #{winner.name} won with #{winner.score} points! #{winner.name} has won #{winner.win_count} times."

	#reset each player's score to 0 after game has ended and scores tallied 
	players.each {|player| player.score = 0}
end

=begin
Adds all player names given into the players array.
updates:
	players
=end
def generate_players(players)
	input_string = "Please enter the names of all the players: \n"
	input = prompt(input_string)

	#add each given name as a separate element to players array
	names = input.split(" ")

	for name in names do
		players.push(Player.new name)
	end
end

=begin
Main method. Begins game by collecting player information. Keeps track of player points and displays at the end of game. 
updates:
	cards_displayed
	Player class
=end
def start_games
    cards_available = []
    cards_displayed = []
    cards_used = []
    players = []

	generate_deck(cards_available)
	generate_players(players)

	#begin a game
	while true do
		play_set(cards_available, cards_displayed, cards_used, players)

		#allow players to end game
		quit_prompt = prompt("Continue playing?")
		if quit_prompt == "no" || quit_prompt == "n"
			puts "Ending the game"
			return
        end
	end
end

start_games
