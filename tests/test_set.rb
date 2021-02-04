require 'minitest/autorun'
require 'set' 
class TestCard < MiniTest::Test

#tests if addThreeDisplayedCardsToUsed will add the 3 given cards to the given array
def test_addThreeDisplayedCardsToUsed
    @cardOne = Card.new "purple", "oval", "striped", 1 
    @cardTwo = Card.new "red", "squiggly", "solid", 2
    @cardThree= Card.new "green", "diamond", "empty", 3

    originalArray = set.cardsUsed.push(cardOne, cardTwo, cardThree)
    returnedArray = set.addThreeDisplayedCardsToUsed(cardOne, cardTwo, cardThree)

    assert_equal returnedArray, originalArray
end

#tests if cardsAvailable will end up containing all elements from both cardsUsed and cardsDisplayed
#will not check order since order is randomly shiffled #####################
def test_shuffleDeck
    @card = Card.new "purple", "oval", "empty", 1
    assert_equal 1, @card.number
end 

#tests if 3 given cards are a set. Here they are.
def test_addThreeDisplayedCardsToUsed
    @cardOne = Card.new "purple", "oval", "striped", 1
    @cardTwo = Card.new "red", "squiggly", "solid", 2
    @cardThree= Card.new "green", "diamond", "empty", 3

    isSetActual = true
    isSetReturned = set.isSet(cardOne, cardTwo, cardThree)

    assert_equal isSetReturned, isSetActual
end

#tests if 3 given cards are a set. Here they are not.
def test_addThreeDisplayedCardsToUsed
    @cardOne = Card.new "purple", "oval", "striped", 1
    @cardTwo = Card.new "red", "diamond", "solid", 2
    @cardThree= Card.new "green", "diamond", "empty", 3

    isSetActual = false
    isSetReturned = set.isSet(cardOne, cardTwo, cardThree)

    assert_equal isSetReturned, isSetActual
end
end
