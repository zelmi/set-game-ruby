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

=begin

Class Card {
	  Symbol
	  Color
	  Shading
	  Number

	  Card (sy, co, sh, nu){
		  Assign each variable to one of the parameters
    }

    toString {
	    Function writes out the value of each card using reduce method
    }
}

=end

=begin

Class Player {
	  Identifier
	  Score
	  TimesWon

	  Player() {
	  }
}

=end

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


