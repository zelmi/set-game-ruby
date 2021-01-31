# Main Set Project Ruby File
# Esther Hu
# Nick Springer
# Zehur Elmi
# Evan Hubert

=begin
Global Variables:
CardsAvailable (Array of cards left to be played)
CurrentCards (Array of currently used cards)
CardsUsed (Array of previously used cards)
Players (Array of players)
=end
$cards_available = []
$current_cards = []
$cards_used = []
class Card
	 =begin
	 #four numbers indicating each attribute
	Symbol
	Color
	Shading
	Number
	=end
	def toString
		#to do but could we just use inpsect instead?
	end
   =begin
	toString {
	    Function writes out the value of each card using reduce method
	}
   =end

   #creates a new card
   def initialize(id, sym, col, shad, num) #added card id so player can identify which card they want to pick for the set. I was thinking this could be an int like 1 and the actual number for the card would be a string like "two"
      @card_id = id
      @symbol = sym
      @color = col
      @shading = shad
      @number = num
   end

  	def ==(next)
    	self.card_id  == next.card_id &&
    	self.symbol == next.symbol &&
		self.color == next.color &&
		self.shading == next.shading &&
		self.number == next.number
  	end
end



class Player 
	  =begin
	Identifier
	  Score
	  TimesWon
	=end
	def initialize(id, sc, time,)
		@identity = id
		@score = sc
		@timeswon = time
	end

	 =begin
	 Player() {
	  }
	=end

end

# returns an array of however many cards needed
# called at beginning of game to create original 81 card
# then called by addThree function whenever needed
InitializeCards(int num_cards) do
	$i = 0

	# initialize empty array 
	newCards = Array.new num_cards , []

	#continue adding cards to the array until num_cards is reached
	while $i < $num_cards  do
		#add new card returned from Card.initialize to array
		newCards << Card.initialize ()
		$i +=1
	 end 

  end

InitializePlayers(int num_players) do
  # run a for loop adding players and their token to the game
end

ResetDeck() do
	colors = ["red", "blue", "green"]
	symbols = ["diamond", "squiggle", "oval"]
	shading = ["blank", "striped", "solid"]
	numbers = ["one", "two", "three"]
	 # set the global variable Deck to 12 random cards
	#this is what i have but i haven't checked to see if it works
	while current_cards.length < 12 do
		sym = symbols.sample
		col = colors.sample
		shad = shading.sample
		num = numbers.sample
		$current_cards.push(Card.new(nil, sym, col, shad, num))
		unique_deck = $current_cards.uniq.each{|card|, card.symbol, card.color, card.shading, card.number}
		if unique_deck.length != $current_cards.length
			$current_cards = unique_deck.clone
		end
	end
		for i in 1..12 do
			$current_cards[i].card_id = i
		end
		
end

isSet(Card one, Card two, Card three) do
  # checks if 2 cards have an attribute that the third doesn't share. If yes, not a set. Return false.
  # else return true
  # Return statements necessary as they are much more useful in this situation than tracking  a variable
  # Have confirmed acceptance from professor

	unless(((one.symbol == two.symbol) && (two.symbol == three.symbol)) || ((one.symbol != two.symbol) && (two.symbol != three.symbol) && (three.symbol !=one.symbol))) 
		return false
	end
	
	unless(((one.color == two.color) && (two.color == three.color)) || ((one.color != two.color) && (two.color != three.color) && (three.color !=one.color))) 
		return false
	end

	unless(((one.shading == two.shading) && (two.shading == three.shading)) || ((one.shading != two.shading) && (two.shading != three.shading) && (three.shading !=one.shading))) 
		return false
	end

	unless(((one.number == two.number) && (two.number == three.number)) || ((one.number != two.number) && (two.number != three.number) && (three.number !=one.number))) 
		return false
	end

	return true

end

trackScores() do
  # track player scores
end

#returns an array of 3 cards to caller, to be added to callers existing array
addThree() do
	newCards = InitializeCards (3)
end


