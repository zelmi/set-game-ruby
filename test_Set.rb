require 'minitest/autorun'
require 'Set' 
class TestCard < MiniTest::Test

#tests if addThreeDisplayedCardsToUsed will add the 3 given cards to the given array
def test_addThreeDisplayedCardsToUsed
    @cardOne = Card.new 1, "oval", "shaded", "pink"
    @cardTwo = Card.new 2, "wavy", "solid", "blue"
    @cardThree= Card.new 3, "diamond", "hollow", "green"

    originalArray = Set.cardsUsed.push(cardOne, cardTwo, cardThree)
    returnedArray = Set.addThreeDisplayedCardsToUsed(cardOne, cardTwo, cardThree)

    assert_equal returnedArray, originalArray
end

#tests if cardsAvailable will end up containing all elements from both cardsUsed and cardsDisplayed
#will not check order since order is randomly shiffled #####################
def test_shuffleDeck
    @card = Card.new 1, "oval", "open", "red"
    assert_equal 1, @card.number
end 

#tests if 3 given cards are a set. Here they are.
def test_addThreeDisplayedCardsToUsed
    @cardOne = Card.new 1, "oval", "shaded", "pink"
    @cardTwo = Card.new 2, "wavy", "solid", "blue"
    @cardThree= Card.new 3, "diamond", "hollow", "green"

    isSetActual = false
    isSetReturned = Set.isSet(cardOne, cardTwo, cardThree)

    assert_equal isSetReturned, isSetActual
end

#tests if 3 given cards are a set. Here they are not.
def test_addThreeDisplayedCardsToUsed
    @cardOne = Card.new 1, "oval", "shaded", "pink"
    @cardTwo = Card.new 2, "diamond", "solid", "blue"
    @cardThree= Card.new 3, "diamond", "hollow", "green"

    isSetActual = false
    isSetReturned = Set.isSet(cardOne, cardTwo, cardThree)

    assert_equal isSetReturned, isSetActual
end
end
