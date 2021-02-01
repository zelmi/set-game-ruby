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
InitializeDeck() do
	symbols = ["diamond", "squiggle", "oval"]
	colors = ["red", "blue", "green"]
	shading = ["blank", "striped", "solid"]
	numbers = ["one", "two", "three"]
	colors.each do |color|
		symbols.each do |symbol|
  			shading.each do |shade|
				numbers.each do |number|
	    				$cards_available << Card.new( nil, symbol, color, shade, number )
				end
  			end
		end
	end
end
	
InitializePlayers(int num_players) do
	i = 0

	# initialize empty array 
	newPlayers = Array.new num_players , []

	#continue adding players to the array until num_players is reached
	while i < num_players  do
		#add new player returned from Player.initialize to array
		newPlayers << Player.initialize ()
		i +=1
	 end 
end

ResetDeck() do
	# set the global variable Deck to 12 random cards
	while $current_cards.length < 12 do
		card = $cards_available.sample
		$current_cards << card
		$cards_available.delete(card)
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
  	player.score += 1 #found another set. might need a a global array for the players
end

#returns an array of 3 cards to caller, to be added to callers existing array
addThree() do
	i = 0
	while i < 3 do
		card = $cards_available.sample
		$current_cards << card
		$cards_available.delete(card)
		i += 1
	end
		
end


