require 'minitest/autorun'
require 'set' 
class TestCard < MiniTest::Test

#tests if addThreeDisplayedCardsToUsed will add the 3 given cards to the given array
def test_add_three_displayed_cards_to_used_1
    @card_one = Card.new "purple", "oval", "striped", 1 
    @card_two = Card.new "red", "squiggly", "solid", 2
    @card_three= Card.new "green", "diamond", "empty", 3

    original_array = set.cards_used.push(card_one, card_two, card_three)
    returned_array = set.add_three_displayed_cards_to_used(card_one, card_two, card_three)

    assert_equal returned_array, original_array
end

#tests if cardsAvailable will end up containing all elements from both cardsUsed and cardsDisplayed
#will not check order since order is randomly shiffled #####################
def test_shuffle_deck
    @card = Card.new "purple", "oval", "empty", 1
    assert_equal 1, @card.number
end 

#tests if 3 given cards are a set. Here they are.
def test_add_three_displayed_cards_to_used_2
    @card_one = Card.new "purple", "oval", "striped", 1
    @card_two = Card.new "red", "squiggly", "solid", 2
    @card_three= Card.new "green", "diamond", "empty", 3

    is_set_actual = true
    is_set_returned = set.is_set(card_one, card_two, card_three)

    assert_equal is_set_returned, is_set_actual
end

#tests if 3 given cards are a set. Here they are not.
def test_add_three_displayed_cards_to_used_3
    @card_one = Card.new "purple", "oval", "striped", 1
    @card_two = Card.new "red", "diamond", "solid", 2
    @card_three= Card.new "green", "diamond", "empty", 3

    is_set_actual = false
    is_set_returned = set.is_set(card_one, card_two, card_three)

    assert_equal is_set_returned, is_set_actual
end
end
