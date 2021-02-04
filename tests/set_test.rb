require 'minitest/autorun'
require_relative '../lib/set.rb'

class TestCard < MiniTest::Test
    #tests if addThreeDisplayedCardsToUsed will add the 3 given cards to the given array
    def test_add_three_displayed_cards_to_used
        card_one = Card.new(0, 0, 0, 1)
        card_two = Card.new(0, 0, 0, 2)
        card_three = Card.new(0, 0, 0, 3)

        cards_displayed = [card_one, card_two, card_three]
        cards_used = []

        add_three_displayed_cards_to_used(cards_displayed, cards_used, card_one, card_two, card_three)

        cards_used_wanted = [card_one, card_two, card_three]
        cards_displayed_wanted = []

        assert_equal cards_used, cards_used_wanted
        assert_equal cards_displayed, cards_displayed_wanted
    end

    # tests the is_set method by giving an example that is a set
    def test_is_set_is_a_set
        card_one = Card.new(0, 0, 0, 1)
        card_two = Card.new(0, 0, 0, 2)
        card_three = Card.new(0, 0, 0, 3)

        is_set_result = is_set(card_one, card_two, card_three)
        is_set_wanted = true

        assert_equal is_set_result, is_set_wanted
    end

    # tests the is_set method by giving an example that is not a set
    def test_is_set_is_not_a_set
        card_one = Card.new 0, 0, 0, 1
        card_two = Card.new 0, 0, 0, 2
        card_three = Card.new 1, 0, 0, 3

        is_set_result = is_set(card_one, card_two, card_three)
        is_set_wanted = false

        assert_equal is_set_result, is_set_wanted
    end
end
