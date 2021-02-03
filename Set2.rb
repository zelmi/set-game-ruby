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
	def toString
		colors = ["blue", "green", "pink"]
		symbols = ["oval", "diamond", "wavy"]
		shadings = ["shaded", "solid", "hollow"]
		"#{colors[@color]} #{symbols[@symbol]} #{shadings[@shading]} #{@amount}"
    end
end

#player class and initializer
class Player
	attr_accessor :name, :score, :winCount

	#attributes of each player
	def initialize(name)
		@name = name
		@score = 0
		@winCount = 0
		end
end

=begin
Global Variables:
CardsAvailable (Array of cards left to be played)
cardsDisplayed (Array of currently used cards)
CardsUsed (Array of previously used cards)
Players (Array of players)
=end
$cardsAvailable = []
$cardsDisplayed = []
$cardsUsed = []
$players = []


=begin
Generates 81 card deck to be added to cardsAvailable array.
updates:
	cardsAvailable
=end
def generateDeck
	for color in 0...3
		for symbol in 0...3
			for shading in 0...3
				for amount in 1...4
					$cardsAvailable.push(Card.new(color, symbol, shading, amount))
				end
			end
		end
	end
end


=begin
Adds a card from the cardsAvailable deck to the cardsDisplayed desk.
Removes card from cardsAvailable.
updates:
	cardsAvailable
	cardsDisplayed
=end
def addRandomCardFromAvailableToDisplayed
	if $cardsAvailable.length == 0 
		return
	end

	#chooses a random index for card choice
	randomCardIndex = rand(0...$cardsAvailable.length)
	#removes chosen card from cardsAvailable
	randomCard = $cardsAvailable.delete_at(randomCardIndex)

	#adds chosen card to be displayed to players
    $cardsDisplayed.push(randomCard)
end

=begin
########################################################################
=end
def addRandomAvailableCardsToDisplayed(numPlayers)
	for i in 0...numPlayers
		addRandomCardFromAvailableToDisplayed()
	end
end

=begin
It takes in 3 cards and adds them to cardsUsed. It removes the cards from cardsDisplayed
updates:
	cardsUsed
	cardsDisplayed
=end
def addThreeDisplayedCardsToUsed(cardOne, cardTwo, cardThree)

	#removes three given cards from cardsDisplayed
	$cardsDisplayed = $cardsDisplayed.filter {|card| !(card.equals(cardOne) || card.equals(cardTwo) || card.equals(cardThree))}

	#adds the three cards to cardsUsed
	$cardsUsed.push(cardOne, cardTwo, cardThree)
end

=begin
It adds all card objects from cardsUsed and cardsDisplayed into cardsAvailable. 
It resets cardsDisplayed and cardsUsed
updates:
	cardsAvailable
clears:
	cardsUsed
	cardsDisplayed
=end
def shuffleDeck
	$cardsAvailable.push(*$cardsUsed)
	$cardsAvailable.push(*$cardsDisplayed)

	$cardsDisplayed = []
	$cardsUsed = []
end

=begin
Takes in 3 card objects and checks if they are a set.
Returns a boolean true if set and false if not set.
=end
def isSet(cardOne, cardTwo, cardThree)

	#checks if all cards share any attribute
	allSameNumber = cardOne.amount == cardTwo.amount && cardTwo.amount == cardThree.amount
	allSameColor = cardOne.color == cardTwo.color && cardTwo.color == cardThree.color
	allSameShading = cardOne.shading == cardTwo.shading && cardTwo.shading == cardThree.shading
	allSameSymbol = cardOne.symbol == cardTwo.symbol && cardTwo.symbol == cardThree.symbol

	#checks if all cards share no attributes
	allDifferentNumber = cardOne.amount != cardTwo.amount && cardTwo.amount != cardThree.amount
	allDifferentColor = cardOne.color != cardTwo.color && cardTwo.color != cardThree.color
	allDifferentShading = cardOne.shading != cardTwo.shading && cardTwo.shading != cardThree.shading
	allDifferentSymbol = cardOne.symbol != cardTwo.symbol && cardTwo.symbol != cardThree.symbol

	#determines if cards are a set by checking if all attributes are either different or the same
	allDifferentOrSameNumber = allSameNumber || allDifferentNumber
	allDifferentOrSameColor = allSameColor || allDifferentColor
	allDifferentOrSameShading = allSameShading || allDifferentShading
	allDifferentOrSameSymbol = allSameSymbol || allDifferentSymbol

	#final boolean determining if cards are a set
	allDifferentOrSameNumber && allDifferentOrSameColor && allDifferentOrSameShading && allDifferentOrSameSymbol
end

=begin
Displays cards to players and asks them to find a set. Various functions handle different situations. 
updates:
	cardsAvailable
	cardsDisplayed
=end
def playSet

	#display cards as long as there are at least 3
	while $cardsDisplayed.length >= 3 do
		inputString = "Which are sets? Enter player name and card indexes separated by a space. Enter blank if set not found. (#{$cardsAvailable.length} cards left in available deck) #{$cardsDisplayed.enum_for(:each_with_index).map{|card, i| "\n#{i + 1}: #{card.toString()}"}.join("")}"

		input = prompt(inputString)

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
			playerName = tokens[0]

			tokens.delete_at(0)

			numbers = tokens.map {|n| Integer(n)}

			#check if user inserted valid input
			while tokens.length != 3 do
				puts("Invalid input, please try again\n")
				input = prompt(inputString)
				tokens = input.split(" ")
				playerName = tokens[0]
				tokens.delete_at(0)
				numbers = tokens.map {|n| Integer(n)}
			end

			#array for cards chosen by player
			cards = []
			
			#add chosen cards from cardsDisplayed to cards array
			for i in 0...$cardsDisplayed.length
				if numbers.include?(i)
					cards.push($cardsDisplayed[i])
				end
			end

			#check if the cards chosen by player are a set. Keep track of which player chose the cards
			if isSet(cards[0], cards[1], cards[2])
				player = $players.find {|p| p.name == playerName}

				#update the player's score tally if they have chosen a set correctly
				player.score += 1
				puts "\nThis is a set! #{player.name} has scored #{player.score} times!"

				#refill the array to make sure 12 cards are displayed to players again
				if $cardsDisplayed.length > 12
					addThreeDisplayedCardsToUsed(cards[0], cards[1], cards[2])
				else
					addThreeDisplayedCardsToUsed(cards[0], cards[1], cards[2])
					addRandomAvailableCardsToDisplayed(3)
				end
			else
				puts "\nNot a set, try again"
			end
		else

			#if user cannot find a set, add 3 more cards
			if $cardsAvailable.length >= 3
				puts "\nOkay...here's some more"
				addRandomAvailableCardsToDisplayed(3)
			else

				#gives user more cards if there are less than 3 left
				puts "\nNo more left, use these cards!"
            		end
		end
	end
end

=begin
Adds all player names given into the players array.
updates:
	players
=end
def generatePlayers(list)
	
	for i in 1..list.length do
		$players.push(Player.new(list[i - 1]))
	end
end

=begin
Main method. Begins game by collecting player information. Keeps track of player points and displays at the end of game. 
updates:
	cardsDisplayed
	player class
=end
def startGames
	generateDeck()
	inputString = "Please enter the names of all the players: \n"

	input = prompt(inputString)

	#add each given name as a separate element to players array
	names = input.split(" ")
	generatePlayers(names)

	#begin a game
	while true do
		puts "Starting a new game!"
		addRandomAvailableCardsToDisplayed(12)

		playSet()

		#calculate the winner of the game by tracking points
		winner = $players.reduce {|mostPoints, currentPoints| currentPoints.score > mostPoints.score ? currentPoints : mostPoints }

		#keep track of number of times each player has won
		winner.winCount += 1
		puts "Game over... #{winner.name} won with #{winner.score} points! #{winner.name} has won #{winner.winCount} times."

		#reset each player's score to 0 after game has ended and scores tallied 
		$players.each {|player| player.score = 0}

		#allow players to end game
		if prompt("Continue playing?") == ("no" || "n")
			puts "Ending the game"
			return
        end

		#reshuffle the deck and start again if players choose so
		shuffleDeck()
	end
end

startGames()
