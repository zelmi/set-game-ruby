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
	 = Symbol
	  Color
	  Shading
	  Number=
	def toString
		#to do but could we just use inpsect instead?
	end
   = toString {
	    Function writes out the value of each card using reduce method
   = }

   def initialize(id, sym, col, shad, num) #added card id so player can identify which card they want to pick for the set
      @card_id = id
      @symbol = sym
      @color = col
      @shading = shad
      @number = num
   end
end



class Player 
	  =Identifier
	  Score
	  TimesWon=
	def initialize(id, sc, time,)
		@identity = id
		@score = sc
		@timeswon = time
	end

	 = Player() {
	  }=

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


