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

class Card
	 =begin
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

InitializePlayers(int num_players) do
  # run a for loop adding players and their token to the game
end

ResetDeck() do
  # set the global variable Deck to 12 random cards
end

IsSet(card_one, card_two, card_three) do
  # checks if 2 cards have an attribute that the third doesn't share. If yes, not a set. Return false.
  # else return true
end

trackScores() do
  # track player scores
end

addThree() do
  # the title. Needed in a lot of places
end


