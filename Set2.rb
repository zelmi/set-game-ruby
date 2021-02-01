def prompt(message)
    puts message
    gets.chomp()
end

class Card
	initialize(color, symbol, shading, amount)
		@color = color
		@symbol = symbol
		@shading = shading
		@amount = amount
    end

	equals(other)
		return (
			@amount == other.amount &&
			@color == other.color &&
			@shading == other.shading &&
			@symbol == other.symbol
		)
	end

	toString()
		return "#{this.color} #{this.symbol} #{this.shading} #{this.amount}"
    end
end

class Player
	initialize(name)
		@name = name
		@score = 0
		@winCount = 0
    end
end

cardsAvailable = []
cardsDisplayed = []
cardsUsed = []
players = []

def generateDeck()
	for color in 0...3
		for symbol in 0...3
			for shading in 0...3
				for amount in 0...3
					cardsAvailable.push(Card.new(color, symbol, shading, amount))
                end
			end
		end
	end
end

def addRandomCardFromAvailableToDisplayed()
	if cardsAvailable.length == 0 return

	randomCardIndex = rand(0...cardsAvailable.length)
	randomCard = cardsAvailable.delete_at(randomCardIndex)

    cardsDisplayed.push(randomCard)
end

def addRandomAvailableCardsToDisplayed(numPlayers)
	for i in 0...numPlayers
		addRandomCardFromAvailableToDisplayed()
    end
end

def addThreeDisplayedCardsToUsed(cardOne, cardTwo, cardThree)
	cardsDisplayed = cardsDisplayed.filter {|card| !(card.equals(cardOne) || card.equals(cardTwo) || card.equals(cardThree))}
	cardsUsed.push(cardOne, cardTwo, cardThree)
end

def shuffleDeck()
	cardsAvailable.push(*cardsUsed)
	cardsAvailable.push(*cardsDisplayed)

	cardsDisplayed = []
	cardsUsed = []
end

def isSet(cardOne, cardTwo, cardThree)
	allSameNumber = cardOne.amount == cardTwo.amount && cardTwo.amount == cardThree.amount
	allSameColor = cardOne.color == cardTwo.color && cardTwo.color == cardThree.color
	allSameShading = cardOne.shading == cardTwo.shading && cardTwo.shading == cardThree.shading
	allSameSymbol = cardOne.symbol == cardTwo.symbol && cardTwo.symbol == cardThree.symbol

	allDifferentNumber = cardOne.amount != cardTwo.amount && cardTwo.amount != cardThree.amount
	allDifferentColor = cardOne.color != cardTwo.color && cardTwo.color != cardThree.color
	allDifferentShading = cardOne.shading != cardTwo.shading && cardTwo.shading != cardThree.shading
	allDifferentSymbol = cardOne.symbol != cardTwo.symbol && cardTwo.symbol != cardThree.symbol

	allDifferentOrSameNumber = allSameNumber || allDifferentNumber
	allDifferentOrSameColor = allSameColor || allDifferentColor
	allDifferentOrSameShading = allSameShading || allDifferentShading
	allDifferentOrSameSymbol = allSameSymbol || allDifferentSymbol

	return allDifferentOrSameNumber && allDifferentOrSameColor && allDifferentOrSameShading && allDifferentOrSameSymbol
end

def playSet()
	while cardsDisplayed.length >= 3 do
		input = prompt("Which are sets?#{cardsDisplayed.map({|card, i| "\n#{i}: #{card.toString()}"}).join("")}")

		if input != nil
			tokens = input.split(" ")
			playerName = tokens[0]

			tokens.delete_at(0)

			numbers = tokens.map {|n| Integer(n)}
			cards = cardsDisplayed.filter {|_, i| numbers.include?(i)}

			if isSet(cards[0], cards[1], cards[2])
				player = players.find {|p| p.name == playerName}

				puts "This is a set! #{player.name} has scored #{++player.score} times!"

				if cardsDisplayed.length > 12
					addThreeDisplayedCardsToUsed(cards[0], cards[1], cards[2])
				else
					addThreeDisplayedCardsToUsed(cards[0], cards[1], cards[2])
					addRandomAvailableCardsToDisplayed(3)
                end
			else
				puts "Not a set, try again"
            end
		else
			if cardsAvailable.length >= 3
				puts "Okay...here's some more"
				addRandomAvailableCardsToDisplayed(3)
			else
				puts "No more left, use these cards!"
            end
		end
	end
end

def generatePlayers()
	players.push(Player.new("nick"), Player.new("michael"))
end

def startGames()
	generateDeck()
	generatePlayers()

	while true do
		addRandomAvailableCardsToDisplayed(12)

		playSet()

		winner = players.reduce {|mostPoints, currentPoints| currentPoints.score > mostPoints.score ? currentPoints : mostPoints }

		puts(
			"Game over... #{winner.name} won with #{winner.score} points! #{winner.name} has won #{++winner.winCount} times."
		)

		players.each {|player| player.score = 0}

		unless prompt("Continue playing?")
			puts "Ending the game"
			return
        end

		shuffleDeck()
	end
end

startGames()
